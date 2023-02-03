require_relative 'book'
require_relative 'student'
require_relative 'teacher'

class App
  attr_reader :books, :persons, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def prompt
    puts "\n"
    puts 'Please choose an option by entering a number'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Exit'
  end

  # rubocop:disable Metrics
  def receive_input
    input = gets.chomp
    number = input.to_i
    case number
    when 1
      list_books
    when 2
      list_persons
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      puts "\n"
      puts 'Thank you for using this app.'
      true
    else
      puts "\n"
      puts 'Warning! Please provide a valid number'
    end
    false
  end
  # rubocop:enable Metrics

  def list_books
    books.each do |element|
      puts "Title: \"#{element.title}\", Author: #{element.author}"
    end
  end

  def list_persons
    persons.each do |element|
      if element.is_a?(Student)
        puts "[Student] Name: #{element.name}, ID: #{element.id}, Age: #{element.age}"
      else
        puts "[Teacher] Name: #{element.name}, ID: #{element.id}, Age: #{element.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    input = gets.chomp
    case input
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts "\n"
      puts 'Warning! Please provide a valid number'
    end
  end

  def create_student
    age = prompt_age
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    gets.chomp
    student = Student.new(age, name)
    persons << student
    puts 'Student created successfully'
  end

  def create_teacher
    age = prompt_age
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    persons << teacher
    puts 'Teacher created successfully'
  end

  def prompt_age
    print 'Age: '
    num = gets.chomp
    age = num.to_i
    if age.zero?
      puts "\n"
      puts 'Warning! Please provide a valid age'
      prompt_age
    end
    age
  end

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
