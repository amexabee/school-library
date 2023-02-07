require 'json'
require 'fileutils'
require_relative '../book'
require_relative '../student'
require_relative '../teacher'

def load_data
    puts 'LOADING...'
    
    book_data = []
    book_data = JSON.parse(File.read('./data/books.json')) if File.exists?("./data/books.json") 
    
    book_data.each do |item|
      book = Book.new(item['title'], item['author'])
      books << book
    end
    
    person_data = []
    person_data = JSON.parse(File.read('./data/persons.json')) if File.exists?("./data/persons.json") 
    person_data.each do |item|
      if item['type'] == "Student"
        person = Student.new(item['age'], item['name'])
      else
        person = Teacher.new(item['age'], item['specialization'], item['name'])
      end
      persons << person
    end
end