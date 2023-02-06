require_relative 'app'

def main
  puts 'Welcome to School Library App!'
  app = App.new
  options = ['Please choose an option by entering a number', '1. List all books', '2. List all people',
  '3. Create a person', '4. Create a book', '5. Create a rental',
  '6. List all rentals for a given person id', '7. Exit']
  repeat = true
  while repeat
    puts "\n"
    options.each do |element|
      puts element
    end
    input = gets.chomp
    number = input.to_i
    repeat = app.receive_input(number)
  end
end

main
