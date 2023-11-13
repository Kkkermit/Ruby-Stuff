require 'rest-client'
require 'json'

def fetch_star_wars_character(character_id)
  url = "https://swapi.dev/api/people/#{character_id}/"
  response = RestClient.get(url)

  if response.code == 200
    character_data = JSON.parse(response.body)
    display_star_wars_character(character_data)
  else
    puts "Error fetching character data. HTTP Status Code: #{response.code}"
  end
end

def display_star_wars_character(character_data)
  puts "Name: #{character_data['name']}"
  puts "Height: #{character_data['height']} cm"
  puts "Mass: #{character_data['mass']} kg"
  puts "Hair Color: #{character_data['hair_color']}"
  puts "Eye Color: #{character_data['eye_color']}"
  puts "Birth Year: #{character_data['birth_year']}"
end

# Prompt the user for a Star Wars character ID
print "Enter a Star Wars character ID to fetch information: "
character_id = gets.chomp.to_i

# Fetch and display Star Wars character information
fetch_star_wars_character(character_id)
