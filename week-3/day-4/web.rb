require 'webrick'

class OurFirstServer < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.body = %{
Hello, world. My favorite number is #{rand(1000)}

<form action="/favorite-color">
  <label for="color">Color:</label>
  <input id="color" name="color" type="text">

  <label for="size">Size:</label>
  <input id="size" name="size" type="text">

  <input type="submit" value="Save">

</form>
}
    response.content_type = "text/html"
    response.status = 200
  end
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
end

$database = ColorDatabase.new

class OurFavoriteColor < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)

    color = request.query["color"]
    size  = request.query["size"]

    $database.remember_color(color)
    $database.remember_size(size)

    response.body = %{
<html>
<head>
<style>
  body {
    background-color: #{color};
    font-size: #{size}em;
  }
</style>
<body>
  <p>Hey there, my favorite color is #{color} and my favorite size is #{size} <a href='/'>HOME</a></p>

  <p>The colors I've seen are #{$database.colors_seen}</p>
  <p>The sizes I've seen are #{$database.sizes_seen}</p>
</body>
</html>
}
    response.content_type = "text/html"
    response.status = 200
  end
end

server = WEBrick::HTTPServer.new(Port: 3000)
server.mount_proc "/" do |request, response|
  response.body = %{
Hello, world. My favorite number is #{rand(1000)}

<form action="/favorite-color">
<label for="color">Color:</label>
<input id="color" name="color" type="text">

<label for="size">Size:</label>
<input id="size" name="size" type="text">

<input type="submit" value="Save">

</form>
}
  response.content_type = "text/html"
  response.status = 200
end
server.mount "/favorite-color", OurFavoriteColor
server.start
