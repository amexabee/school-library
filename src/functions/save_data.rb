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
    puts 'Data saved successfully'
  end

def save_person
    arr = []
    persons.each do |person|
      if person.is_a?(Student) 
      obj = {
        'type' => person.class.name,
        'name' => person.name,
        'age' => person.age,
      }
      else
        obj = {
          'type' => person.class.name,
          'name' => person.name,
          'age' => person.age,
          'specialization' => person.specialization,
        }
      end
    arr.push(obj)
    end
    FileUtils.mkdir_p('data')
    File.write('./data/persons.json', JSON.generate(arr))
    puts 'Data saved successfully'
end
