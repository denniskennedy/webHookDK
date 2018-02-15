require 'sinatra'
#require 'json'
#require 'open-uri'

#result = open('https://requestb.in/1cihnwq1')
#result.lines { |f| f.each_line {|line| p line} }

set :port, 20001

#post '/payload' do
 # push = JSON.parse(request.body.read)
 # puts "I got some JSON: #{push.inspect}"
#end

get '/payload' do
  "Running..."
end
