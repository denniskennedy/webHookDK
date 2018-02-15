# myapp.rb

require 'sinatra'
require 'json'

get '/payload' do
  push = JSON.parse(request.body.read)
  puts "I got some JSON : #(push.inspect)"
end
