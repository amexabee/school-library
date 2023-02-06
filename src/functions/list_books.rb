def list_books
  books.each do |element|
    puts "Title: \"#{element.title}\", Author: #{element.author}"
  end
end
