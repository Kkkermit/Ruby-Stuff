def generate_password(length)
    characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + ['!', '@', '#', '$', '%', '^', '&', '*']
  
    password = Array.new(length) { characters.sample }.join
  end
  
  puts "Welcome to the Cool Password Generator!"
  print "Enter the length of the password: "
  password_length = gets.chomp.to_i
  
  if password_length.positive?
    password = generate_password(password_length)
    puts "Your cool password is: #{password}"
  else
    puts "Invalid length. Please enter a positive number for the password length."
  end