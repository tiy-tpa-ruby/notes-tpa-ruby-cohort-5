require 'sinatra'
require 'rack-flash'

require 'sinatra/reloader' if development?
require "sinatra/content_for"

require_relative 'models'

use Rack::MethodOverride

enable :sessions
set :session_secret, "The crow flies at midnight"

use Rack::Flash

# Playing with activerecord
def playground
  # Get the football team
  team = Team.find_by(name: "TIY Football")
  p team

  # Get the sponsor for the football team
  the_football_sponsor = team.sponsor
  p the_football_sponsor

  # Iterate over all teams and print out the sponsors
  teams = Team.all
  teams.each do |team|
    sponsor = team.sponsor
    puts "#{team.name} is sponsored by #{sponsor.name}"
  end

  # Iterate over all the sponsors and print their teams
  sponsors = Sponsor.all
  sponsors.each do |sponsor|
    teams = sponsor.teams
    teams.each do |team|
      puts "#{sponsor.name} sponsors the #{team.name}"
    end
  end
end

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  @players = Player.all
  @teams = Team.all

  erb :homepage
end

get '/players/new' do
  # Example of using a different layout
  # erb :player_form, layout: :special_layout

  # Make a blank player to satisfy the form
  # We can even have default values
  @player = Player.new(shirt_size: "XS")

  erb :player_form
end

post '/players/create' do
  @player = Player.create(params)
  if @player.valid?
    redirect "/players/#{@player.id}"
  else
    # rerender the 'new' player form
    flash[:error] = @player.errors.full_messages.join(", ")
    erb :player_form
  end
end

post '/players/search' do
  @name = params["name"]

  player = Player.where("name like '%#{@name}%'").first
  if player
    redirect "/players/#{player.id}"
  else
    erb :not_found
  end
end

post '/players/delete/:id' do
  @id = params["id"]
  player = Player.find_by(id: @id)

  if player
    player.delete
    redirect "/"
  else
    flash[:error] = "Sorry, nobody with ID #{@id}"
    redirect "/"
  end
end

get '/players/:id' do
  player_id = params[:id]
  @player = Player.find_by(id: player_id)

  erb :player_details
end

# Teams start here

# REST
#
# Implementing this, is working towards a "REST"ful interface
#
# | Verb   | Path            | Action   | Used for                                                |
# |--------|-----------------|----------|---------------------------------------------------------|
# | GET    | /teams          | index    | Showing list of teams                                   |
# | GET    | /teams/new      | new      | Showing HTML form for creating a new team               |
# | POST   | /teams          | create   | Creating a new team and redirecting to listing (/teams) |
# | GET    | /teams/:id      | show     | Show a specific team                                    |
# | GET    | /teams/:id/edit | edit     | Show an edit page for a team                            |
# | PUT    | /teams/:id      | update   | update a specific team (redirect to show                |
# | DELETE | /teams/:id      | delete   | delete a specific team (redirect to listing)            |

# action: index
# action: search if we supply a "name" param
# This code does double duty
get '/teams' do
  @name = params["name"]

  if @name
    @teams = Team.where("name like '%#{@name}%'")
  else
    @teams = Team.all
  end

  erb :teams_index
end

# action: new
get '/teams/new' do
  erb :teams_new
end

# action :create
post '/teams' do
  team = Team.create(params)

  redirect "/teams/#{team.id}"
end

# action: update
put '/teams/:id' do
  id = params["id"]
  team = Team.find_by(id: id)
  if team
    team.update_attributes(params["team"])

    if team.valid?
      redirect "/teams/#{team.id}"
    else
      erb :teams_edit
    end
  else
    redirect "/"
  end
end

# action: delete
delete '/teams/:id' do
  @id = params["id"]
  team = Team.find_by(id: @id)

  if team
    team.delete
    redirect "/"
  else
    erb :team_not_found
  end
end

# action: show
get '/teams/:id' do
  team_id = params[:id]
  @team = Team.find_by(id: team_id)

  if @team
    erb :teams_show
  else
    flash[:error] = "Sorry, no team with id #{team_id}"

    redirect "/teams"
  end
end

# action: edit
get '/teams/:id/edit' do
  team_id = params[:id]
  @team = Team.find_by(id: team_id)

  erb :teams_edit
end
