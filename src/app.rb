require 'json'
require 'fileutils'
require_relative './functions/list_books'
require_relative './functions/list_persons'
require_relative './functions/create_person'
require_relative './functions/create_book'
require_relative './functions/create_rental'
require_relative './functions/list_rentals'
require_relative './book'

class App
  attr_reader :books, :persons, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def receive_input(number)
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
    else
      puts "\n"
      puts 'Warning! Please provide a valid number'
    end
    true
  end

  def save_data
    arr = []
    books.each do |book|
      obj = {
        'title' => book.title,
        'author' => book.author
      }
      arr.push(obj)
    end
    FileUtils.mkdir_p('data')
    File.write('./data/books.json', JSON.generate(arr))
    puts 'Data saved successfully'
  end

  def load_data
    puts 'LOADING...'
    file_data = JSON.parse(File.read('./data/books.json'))
    file_data.each do |item|
      book = Book.new(item['title'], item['author'])
      books << book
    end
  end
end
