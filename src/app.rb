require_relative 'book'

class App 
  attr_reader :books, :persons

  def initialize
    @books = []
    @persons = []
  end  

  def prompt
    puts "\n"
    puts "Please choose an option by entering a number"
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List all rentals for a given person id"
    puts "7. Exit"
  end 

  def receive_input
    input = gets.chomp
    number = input.to_i
      case number
      when 1
        list_books()
        return false
      when 2
        "list_persons()"
        return false
      when 3
        "create_person()"
      when 4
        create_book()
        return false
      when 5..6
        puts "What now?"  
      when 7    
        puts "\n"
        puts "Thank you for using this app."
        return true
      else
        puts "\n"
        puts "Warning! Please provide a valid number"
      end
  end

  def list_books
    books.each do |element|
        puts "Title: #{element.title}"
        puts "Author: #{element.author}"
    end
  end

  def create_book
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    book = Book.new(title, author)
    books << book
    puts "Book created successfully"
  end
end