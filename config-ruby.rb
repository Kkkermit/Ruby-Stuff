require 'yaml'

# Load the configuration file
config = YAML.load_file('config.yml')

# Access configuration values
puts "Development Database Host: #{config['development']['database']['host']}"
puts "Production Database Host: #{config['production']['database']['host']}"
