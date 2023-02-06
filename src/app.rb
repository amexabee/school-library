require_relative './functions/list_books'
require_relative './functions/list_persons'
require_relative './functions/create_person'
require_relative './functions/create_book'
require_relative './functions/create_rental'
require_relative './functions/list_rentals'

class App
  attr_reader :books, :persons, :rentals, :prompts

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
end
