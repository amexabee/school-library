require_relative '../src/rental'
require_relative '../src/book'
require_relative '../src/person'

describe Rental do
  before :each do
    @book = Book.new 'Title', 'Author'
    @person = Person.new 19, 'Name'
    @rental = Rental.new '2023-02-08', @book, @person
  end
  describe 'Testing for Rental Class' do
    it 'Take 3 parameters and return a Rental object' do
      expect(@rental).to be_instance_of Rental
    end

    it 'Return the correct date' do
      expect(@rental.date).to eql '2023-02-08'
    end

    it 'Return the length of person rentals to be 1' do
      expect(@person.rentals.length).to be 1
    end

    it 'Return the length of book rentals to be 1' do
      expect(@book.rentals.length).to be 1
    end
  end
end
