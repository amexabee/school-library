require_relative 'book'
require_relative './functions/list_books'
require_relative './functions/list_persons'
require_relative './functions/create_person'

class App
  attr_reader :books, :persons, :rentals, :prompts

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  # rubocop:disable Metrics
  def receive_input(number)
    case number
    when 1
      list_books
    when 2
      list_persons
    when 3
      create_person
      true
    when 4
      create_book
      true
    when 5
      create_rental
      true
    when 6
      list_rentals
    when 7
      puts "\n"
      puts 'Thank you for using this app.'
      false
    else
      puts "\n"
      puts 'Warning! Please provide a valid number'
    end
  end
  # rubocop:enable Metrics

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    books << book
    puts 'Book created successfully'
  end

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

  def list_rentals
    print 'Id of person: '
    input = gets.chomp
    id = input.to_i
    puts 'Rentals: '
    rentals.each do |element|
      puts "Date: #{element.date}, Book \"#{element.book.title}\" by #{element.book.author}" if element.person.id == id
    end
  end
end
