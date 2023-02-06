require_relative 'app'

def main
  puts 'Welcome to School Library App!'
  app = App.new
  loop do
    puts "\nPlease choose an option by entering a number
    1. List all books
    2. List all people
    3. Create a person
    4. Create a book
    5. Create a rental
    6. List all rentals for a given person id
    7. Exit"
    input = gets.chomp.to_i
    if input == 7
      puts 'Thank you for using this app.'
      break
    end
    app.receive_input(input)
  end
end

main
