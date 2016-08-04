require 'sinatra'

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
end

$database = ColorDatabase.new

get '/' do
  erb :home
end

get '/favorite_color' do
  @color = params["color"]
  @size  = params["size"]

  $database.remember_color(@color)
  $database.remember_size(@size)

  erb :favorite_color
end
