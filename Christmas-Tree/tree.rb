class ChristmasTree
  attr_accessor :height, :decorations

  def initialize(height)
    @height = height
    @decorations = []
  end

  def draw
    puts "🎄 Merry Christmas! 🎄"

    (1..@height).each do |level|
      spaces = ' ' * (@height - level)
      stars = '*' * (2 * level - 1)
      decorations = decorate_level(level)
      puts "#{spaces}#{stars}#{decorations}"
    end

    draw_trunk
    draw_base
    draw_star
  end

  def decorate_level(level)
    @decorations[level - 1] || ''
  end

  def draw_trunk
    trunk_height = @height / 3
    trunk_spaces = ' ' * (@height - trunk_height)
    trunk = '|' * (trunk_height * 2 - 1)
    puts "#{trunk_spaces}#{trunk}"
  end

  def draw_base
    base_width = @height / 2
    base_spaces = ' ' * (@height - base_width)
    base = '=' * base_width
    puts "#{base_spaces}#{base}"
  end

  def draw_star
    star_spaces = ' ' * (@height - 1)
    star = '★'
    puts "#{star_spaces}#{star}"
  end

  def add_decoration(level, decoration)
    @decorations[level - 1] = decoration
  end
end

def display_menu
  puts "\nChristmas Tree Decorator"
  puts "1. Draw Christmas Tree"
  puts "2. Add Decoration"
  puts "3. Exit"
end

def main
  puts "Welcome to the Christmas Tree Decorator!"

  print "Enter the height of the Christmas tree: "
  tree_height = gets.chomp.to_i

  christmas_tree = ChristmasTree.new(tree_height)

  loop do
    display_menu
    print "Enter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
      christmas_tree.draw
    when 2
      print "Enter the level to decorate: "
      level = gets.chomp.to_i
      print "Enter the decoration (emoji, symbol, or text): "
      decoration = gets.chomp
      christmas_tree.add_decoration(level, decoration)
    when 3
      puts "Exiting the Christmas Tree Decorator. Merry Christmas!"
      break
    else
      puts "Invalid choice. Please enter a number between 1 and 3."
    end
  end
end

# Run the program
main
