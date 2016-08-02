require 'webrick'

class OurFirstServer < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.body = "Hello, world. My favorite number is #{rand(1000)}"
    response.status = 200
  end
end

server = WEBrick::HTTPServer.new(Port: 3000)
server.mount "/", OurFirstServer
server.start
