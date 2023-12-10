# main.rb

require_relative 'gingerbread_house'

# Create a new GingerbreadHouse instance
gingerbread_house = GingerbreadHouse.new

# Add ingredients
gingerbread_house.add_ingredient("Gingerbread dough")
gingerbread_house.add_ingredient("Icing sugar")
gingerbread_house.add_ingredient("Candy canes")
gingerbread_house.add_ingredient("Gumdrops")
gingerbread_house.add_ingredient("Chocolate chips")

# Add instructions
gingerbread_house.add_instruction("Prepare the gingerbread dough following your favorite recipe.")
gingerbread_house.add_instruction("Roll out the dough and cut it into house shapes using templates.")
gingerbread_house.add_instruction("Bake the gingerbread pieces and let them cool.")
gingerbread_house.add_instruction("Assemble the house using icing sugar as glue.")
gingerbread_house.add_instruction("Decorate the house with candy canes, gumdrops, and chocolate chips.")

# Display the recipe
gingerbread_house.display_recipe
