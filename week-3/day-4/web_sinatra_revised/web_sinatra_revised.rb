require 'sinatra'

if development?
  require 'sinatra/reloader'
end

class ColorDatabase
  def initialize
    @colors = []
    @sizes  = []
  end

  def remember_color(color)
    @colors << color
  end

  def remember_size(size)
    @sizes << size
  end

  def colors_seen
    @colors.uniq.join(",")
  end

  def sizes_seen
    @sizes.uniq.join(",")
  end

  def last_color_seen
    @colors.last
  end

  def last_size_seen
    @sizes.last
  end
end

$database = ColorDatabase.new

# Show the search form
get '/search' do
  erb :search
end

# Do the search and show the results
post '/search' do
  @search_color = params["search_color"]

  @found = $database.colors_seen.include?(@search_color)

  haml :search_results
end

# Homepage
get '/' do
  @color = $database.last_color_seen
  @size  = $database.last_size_seen

  erb :home
end

# Add color handler (where the homepage form posts to)
post '/add_colors' do
  @color = params["color"]
  @size  = params["size"]

  $database.remember_color(@color)
  $database.remember_size(@size)

  # Sends the user back to the homepage
  redirect '/'
end

get '/about' do
  @words = %w{Lovingly Carefully Quickly Intelligently}
  @random_word = @words.sample

  haml :about
end
