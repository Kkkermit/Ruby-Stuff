require 'dotenv/load'
require 'net/http'
require 'json'

def get_weather(api_key, city)
  base_url = 'http://api.openweathermap.org/data/2.5/weather'
  params = { q: city, appid: api_key, units: 'metric' }

  uri = URI("#{base_url}?#{URI.encode_www_form(params)}")
  response = Net::HTTP.get(uri)

  JSON.parse(response)
end

def display_weather(weather_data)
  if weather_data['cod'].to_i == 200
    main = weather_data['main']
    weather = weather_data['weather'][0]

    puts "Weather in #{weather_data['name']}, #{weather_data['sys']['country']}:"
    puts "Description: #{weather['description'].capitalize}"
    puts "Temperature: #{main['temp']}°C"
    puts "Humidity: #{main['humidity']}%"
    puts "Pressure: #{main['pressure']} hPa"
  else
    puts "Error: #{weather_data['message']}"
  end
end

api_key = ENV['OPENWEATHERMAP_API_KEY']

puts 'Enter the name of the city:'
city = gets.chomp

weather_data = get_weather(api_key, city)
display_weather(weather_data)
