class ChristmasCard
    def initialize
      @card_list = []
    end
  
    def send_card(to, message)
      @card_list << { to: to, message: message }
      puts "\n🎄 Card sent to #{to}! 🎄"
    end
  
    def view_cards
      puts "\n🎅 Your Christmas Cards 🎅"
      @card_list.each_with_index do |card, index|
        puts "#{index + 1}. To: #{card[:to]}, Message: #{card[:message]}"
      end
    end
  end
  
  def display_menu
    puts "\nChristmas Card Sender"
    puts "1. Send a Christmas Card"
    puts "2. View Christmas Cards"
    puts "3. Exit"
  end
  
  def main
    puts "Welcome to the Christmas Card Sender!"
  
    christmas_card = ChristmasCard.new
  
    loop do
      display_menu
      print "Enter your choice: "
      choice = gets.chomp.to_i
  
      case choice
      when 1
        print "Enter the recipient's name: "
        to = gets.chomp
        print "Enter your festive message: "
        message = gets.chomp
        christmas_card.send_card(to, message)
      when 2
        christmas_card.view_cards
      when 3
        puts "Exiting the Christmas Card Sender. Merry Christmas!"
        break
      else
        puts "Invalid choice. Please enter a number between 1 and 3."
      end
    end
  end
  
  main
  