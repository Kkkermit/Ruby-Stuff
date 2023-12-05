def draw_christmas_tree(height)
    puts "Merry Christmas!"
    (1..height).each do |level|
      spaces = ' ' * (height - level)
      stars = '*' * (2 * level - 1)
      puts "#{spaces}#{stars}"
    end
  
    trunk_height = height / 3
    trunk_spaces = ' ' * (height - trunk_height)
    trunk = '*' * (2 * trunk_height - 1)
    trunk_height.times { puts "#{trunk_spaces}#{trunk}" }
  end
  
  print "Enter the height of the Christmas tree: "
  tree_height = gets.chomp.to_i
  
  draw_christmas_tree(tree_height)
  