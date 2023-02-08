require_relative '../src/book'

describe Book do
  before :each do
    @book = Book.new 'Title', 'Author'
  end
  describe 'Testing for Book Class' do
    it 'Take 2 parameters and return a Book object' do
      expect(@book).to be_instance_of Book
    end

    it 'Return the correct Title' do
      expect(@book.title).to eql 'Title'
    end

    it 'Return the correct Author' do
      expect(@book.author).to eql 'Author'
    end
  end
end
