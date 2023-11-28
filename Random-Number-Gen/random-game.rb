def guess_the_number
    secret_number = rand(1..10)
    puts "I've chosen a number between 1 and 10. Can you guess it?"
  
    loop do
      print "Your guess: "
      user_guess = gets.chomp.to_i
  
      if user_guess == secret_number
        puts "Congratulations! You guessed the correct number."
        break
      else
        puts "Wrong guess. Try again!"
      end
    end
  end
  
  guess_the_number
  