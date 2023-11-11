class Player
    attr_accessor :name, :health, :inventory
  
    def initialize(name)
      @name = name
      @health = 100
      @inventory = []
    end
  
    def display_status
      puts "#{@name}, Health: #{@health}, Inventory: #{@inventory.join(', ')}"
    end
  end
  
  class Game
    def initialize
      @player = nil
    end
  
    def start
      puts "Welcome to the Cool Adventure Game!"
      print "Enter your name: "
      player_name = gets.chomp
      @player = Player.new(player_name)
  
      puts "\nHello, #{@player.name}! Your adventure begins...\n\n"
      play_game
    end
  
    def play_game
      loop do
        puts "Choose an action:"
        puts "1. Explore"
        puts "2. Check inventory"
        puts "3. Quit"
  
        choice = gets.chomp.to_i
  
        case choice
        when 1
          explore
        when 2
          @player.display_status
        when 3
          puts "Thanks for playing! Goodbye."
          break
        else
          puts "Invalid choice. Try again."
        end
      end
    end
  
    def explore
      puts "You embark on a daring adventure!"
      
      @player.health -= 10
      puts "Ouch! You lost 10 health points."
  
      if @player.health <= 0
        puts "Oh no! Your health is too low. Game over."
        exit
      end
    end
  end
  
  # Start the game
  cool_game = Game.new
  cool_game.start
  