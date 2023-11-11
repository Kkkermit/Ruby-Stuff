require 'sinatra'
require 'httparty'

get '/' do
  @joke = fetch_random_joke
  erb :index
end

def fetch_random_joke
  response = HTTParty.get('https://api.chucknorris.io/jokes/random')
  json = JSON.parse(response.body)
  json['value']
end
