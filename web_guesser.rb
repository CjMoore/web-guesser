require 'sinatra'
require 'sinatra/reloader'

get '/' do
  random = rand(100)
  "The SECRET NUMBER is #{random}"
end
