require 'json'
require 'fileutils'
require_relative '../student'

def save_book
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
  puts 'Books saved successfully'
end

def save_person
  arr = []
  persons.each do |person|
    obj = {
      'type' => person.class.name,
      'name' => person.name,
      'age' => person.age
    }
    obj['specialization'] = person.specialization unless person.is_a?(Student)
    arr.push(obj)
  end
  FileUtils.mkdir_p('data')
  File.write('./data/persons.json', JSON.generate(arr))
  puts 'Persons saved successfully'
end

def save_rental
  arr = []
  rentals.each do |rental|
    obj = {
      'date' => rental.date,
      'person' => persons.find_index(rental.person),
      'book' => books.find_index(rental.book)
    }
    arr.push(obj)
  end
  FileUtils.mkdir_p('data')
  File.write('./data/rentals.json', JSON.generate(arr))
  puts 'Rentals saved successfully'
end
