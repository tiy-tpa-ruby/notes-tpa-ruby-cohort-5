require 'sinatra'

get '/hi' do
  "Hello World! My favorite number is #{rand(100)}"
end
