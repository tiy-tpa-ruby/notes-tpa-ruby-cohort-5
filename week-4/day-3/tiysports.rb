require 'sqlite3'
require 'active_record'
require 'sinatra'

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "tiysports.db"
)

# Implies there is a table named "players" (plural)
class Player < ActiveRecord::Base
  # automagically creates accessors for all of the columns
end

class Team < ActiveRecord::Base
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
  erb :player_form
end

post '/players/create' do
  # name = params["name"]
  # age = params["age"]
  # shirt_size = params["shirt_size"]
  # birthday = params["birthday"]
  #
  # person = Player.create(name: name, age: age, shirt_size: shirt_size, birthday: birthday)

  # Params is already what I'm expecting (a hash with keys
  # as the names of my colums and the values being what was
  # entered on the form)
  person = Player.create(params)

  redirect "/players/#{person.id}"
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

get '/players/:id' do
  player_id = params[:id]
  @player = Player.find_by(id: player_id)

  erb :player_details
end

get '/teams/:id' do
  team_id = params[:id]
  @team = Team.find_by(id: team_id)

  erb :team_details
end




#
