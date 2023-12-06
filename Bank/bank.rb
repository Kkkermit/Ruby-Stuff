require 'openssl'

class Bank
  def initialize
    @accounts = {}
  end

  def create_account(name, initial_balance)
    account_number = generate_account_number
    encrypted_pin = encrypt_pin(generate_pin)

    @accounts[account_number] = { name: name, balance: initial_balance, pin: encrypted_pin }

    puts "\nAccount created successfully!"
    display_account_info(account_number)
  end

  def make_transaction(account_number, amount)
    account = @accounts[account_number]
    return puts "\nAccount not found!" unless account

    print "Enter your PIN: "
    entered_pin = encrypt_pin(gets.chomp)

    return puts "\nInvalid PIN. Transaction canceled." unless entered_pin == account[:pin]

    if amount.negative? && (account[:balance] + amount).negative?
      puts "\nInsufficient funds. Transaction canceled."
    else
      account[:balance] += amount
      puts "\nTransaction successful!"
      display_account_info(account_number)
    end
  end

  def check_balance(account_number)
    account = @accounts[account_number]
    return puts "\nAccount not found!" unless account

    print "Enter your PIN: "
    entered_pin = encrypt_pin(gets.chomp)

    return puts "\nInvalid PIN. Access denied." unless entered_pin == account[:pin]

    puts "\nYour account balance is: $#{account[:balance]}"
  end

  private

  def generate_account_number
    rand(10**9..10**10 - 1).to_s
  end

  def generate_pin
    rand(1000..9999).to_s.rjust(4, '0')
  end

  def encrypt_pin(pin)
    cipher = OpenSSL::Cipher.new('AES-128-CBC')
    cipher.encrypt
    cipher.key = OpenSSL::Random.random_bytes(16)  # Generates a random 16-byte key
    cipher.iv = OpenSSL::Random.random_bytes(16)   # Generates a random 16-byte IV
    encrypted_pin = cipher.update(pin) + cipher.final
    encrypted_pin.unpack('H*').first
  end
  

  def display_account_info(account_number)
    account = @accounts[account_number]
    puts "\nAccount Information:"
    puts "Account Number: #{account_number}"
    puts "Account Holder: #{account[:name]}"
    puts "Current Balance: $#{account[:balance]}"
  end
end

def display_menu
  puts "\nBanking System"
  puts "1. Create Account"
  puts "2. Make Transaction"
  puts "3. Check Balance"
  puts "4. Exit"
end

def main
  bank = Bank.new

  loop do
    display_menu
    print "Enter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
      print "Enter your name: "
      name = gets.chomp
      print "Enter initial balance: $"
      initial_balance = gets.chomp.to_f
      bank.create_account(name, initial_balance)
    when 2
      print "Enter your account number: "
      account_number = gets.chomp
      print "Enter transaction amount: $"
      amount = gets.chomp.to_f
      bank.make_transaction(account_number, amount)
    when 3
      print "Enter your account number: "
      account_number = gets.chomp
      bank.check_balance(account_number)
    when 4
      puts "Exiting the Banking System. Thank you for banking with us!"
      break
    else
      puts "Invalid choice. Please enter a number between 1 and 4."
    end
  end
end

main
