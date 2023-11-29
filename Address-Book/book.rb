class Contact
    attr_accessor :name, :phone_number, :email
  
    def initialize(name, phone_number, email)
      @name = name
      @phone_number = phone_number
      @email = email
    end
  
    def to_s
      "#{name} - Phone: #{phone_number}, Email: #{email}"
    end
  end
  
  class AddressBook
    attr_accessor :contacts
  
    def initialize
      @contacts = []
    end
  
    def add_contact(contact)
      @contacts << contact
      puts "Contact added: #{contact.name}"
    end
  
    def list_contacts
      puts "Contacts:"
      @contacts.each_with_index { |contact, index| puts "#{index + 1}. #{contact}" }
    end
  
    def search_contact(name)
      found_contacts = @contacts.select { |contact| contact.name.downcase.include?(name.downcase) }
      if found_contacts.empty?
        puts "No contacts found with the name '#{name}'."
      else
        puts "Contacts found with the name '#{name}':"
        found_contacts.each { |contact| puts contact }
      end
    end
  end
  
  def main
    address_book = AddressBook.new
  
    loop do
      puts "\nAddress Book Menu:"
      puts "1. Add Contact"
      puts "2. List Contacts"
      puts "3. Search Contact"
      puts "4. Exit"
      print "Enter your choice: "
  
      choice = gets.chomp.to_i
  
      case choice
      when 1
        print "Enter contact name: "
        name = gets.chomp
        print "Enter phone number: "
        phone_number = gets.chomp
        print "Enter email address: "
        email = gets.chomp
  
        contact = Contact.new(name, phone_number, email)
        address_book.add_contact(contact)
      when 2
        address_book.list_contacts
      when 3
        print "Enter contact name to search: "
        search_name = gets.chomp
        address_book.search_contact(search_name)
      when 4
        puts "Exiting the address book application. Goodbye!"
        break
      else
        puts "Invalid choice. Please enter a number between 1 and 4."
      end
    end
  end
  
  # Run the program
  main
  