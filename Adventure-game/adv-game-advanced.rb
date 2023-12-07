class Player
    attr_accessor :name, :score
  
    def initialize(name)
      @name = name
      @score = 0
    end
  end
  
  class Location
    attr_accessor :name, :description, :options
  
    def initialize(name, description)
      @name = name
      @description = description
      @options = {}
    end
  
    def add_option(option, destination, points)
      @options[option] = { destination: destination, points: points }
    end
  end
  
  class AdventureGame
    def initialize
      @player = nil
      @locations = {}
      @current_location = nil
    end
  
    def start
      puts "Welcome to the Adventure Game!"
      print "Enter your name: "
      player_name = gets.chomp
      @player = Player.new(player_name)
      create_locations
      play
    end
  
    def create_locations
      home = Location.new("Home", "You are at home.")
      forest = Location.new("Forest", "You find yourself in a mysterious forest.")
      cave = Location.new("Cave", "A dark cave with an eerie atmosphere.")
      beach = Location.new("Beach", "A sunny beach with golden sand.")
  
      home.add_option("Go to the Forest", forest, 10)
      home.add_option("Go to the Cave", cave, 5)
      home.add_option("Go to the Beach", beach, 3)
  
      forest.add_option("Go back home", home, 0)
      forest.add_option("Explore deeper", cave, 8)
      forest.add_option("Relax at the Beach", beach, 5)
  
      cave.add_option("Go back home", home, 0)
      cave.add_option("Explore the Forest", forest, 3)
      cave.add_option("Visit the Beach", beach, 7)
  
      beach.add_option("Go back home", home, 0)
      beach.add_option("Explore the Forest", forest, 2)
      beach.add_option("Enter the Cave", cave, 4)
  
      @locations = { home: home, forest: forest, cave: cave, beach: beach }
      @current_location = @locations[:home]
    end
  
    def play
      loop do
        display_location
        display_options
        take_action
      end
    end
  
    def display_location
      puts "\n#{@player.name}'s Location: #{@current_location.name}"
      puts @current_location.description
    end
  
    def display_options
      puts "\nAvailable Options:"
      @current_location.options.each_with_index do |(option, _), index|
        puts "#{index + 1}. #{option}"
      end
    end
  
    def take_action
      print "Enter the number of your choice: "
      choice_number = gets.chomp.to_i
  
      options_count = @current_location.options.size
      unless (1..options_count).include?(choice_number)
        puts "Invalid choice. Please enter a number between 1 and #{options_count}."
        return
      end
  
      chosen_option = @current_location.options.keys[choice_number - 1]
      destination_info = @current_location.options[chosen_option]
  
      @current_location = destination_info[:destination]
      @player.score += destination_info[:points]
  
      puts "\n#{chosen_option}: #{destination_info[:destination].name}"
      puts "Points gained: #{destination_info[:points]}"
      puts "Total Score: #{@player.score}"
    end
  end
  
  game = AdventureGame.new
  game.start
  