require 'net/http'
require 'json'

def get_iss_data
  uri = URI('http://api.open-notify.org/iss-now.json')
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

def display_iss_data(iss_data)
  if iss_data['message'] == 'success'
    position = iss_data['iss_position']
    velocity = iss_data['velocity']
    crew_count = get_crew_count

    puts "International Space Station (ISS) Information:"
    puts "Current Location: Latitude #{position['latitude']}, Longitude #{position['longitude']}"
    puts "Velocity: #{velocity} km/h"
    puts "Number of People on Board: #{crew_count}"
  else
    puts "Error: #{iss_data['message']}"
  end
end

def get_crew_count
  uri = URI('http://api.open-notify.org/astros.json')
  response = Net::HTTP.get(uri)
  astro_data = JSON.parse(response)
  astro_data['number']
end

iss_data = get_iss_data
display_iss_data(iss_data)
