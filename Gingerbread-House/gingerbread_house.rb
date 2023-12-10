# gingerbread_house.rb

class GingerbreadHouse
    attr_accessor :ingredients, :instructions
  
    def initialize
      @ingredients = []
      @instructions = []
    end
  
    def add_ingredient(ingredient)
      @ingredients << ingredient
    end
  
    def add_instruction(instruction)
      @instructions << instruction
    end
  
    def display_recipe
      puts "Gingerbread House Recipe"
      puts "\nIngredients:"
      @ingredients.each_with_index { |ingredient, index| puts "#{index + 1}. #{ingredient}" }
      puts "\nInstructions:"
      @instructions.each_with_index { |instruction, index| puts "#{index + 1}. #{instruction}" }
    end
  end
  