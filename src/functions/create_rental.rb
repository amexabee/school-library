require_relative '../rental'

def create_rental
  book = select_book
  person = select_person

  print 'Date: '
  date = gets.chomp

  rental = Rental.new(date, book, person)
  rentals << rental
  puts 'Rental created successfully'
end

def select_book
  puts 'Select a book from the following list by number'
  books.each_with_index do |element, index|
    puts "#{index}) Title: \"#{element.title}\", Author: #{element.author}"
  end
  input = gets.chomp
  index = input.to_i
  books[index]
end

def select_person
  puts 'Select a person from the following list by number (not id)'
  persons.each_with_index do |element, index|
    if element.is_a?(Student)
      puts "#{index}) [Student] Name: #{element.name}, ID: #{element.id}, Age: #{element.age}"
    else
      puts "#{index}) [Teacher] Name: #{element.name}, ID: #{element.id}, Age: #{element.age}"
    end
  end
  input = gets.chomp
  index = input.to_i
  persons[index]
end