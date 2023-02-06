def list_rentals
  print 'Id of person: '
  input = gets.chomp
  id = input.to_i
  puts 'Rentals: '
  rentals.each do |element|
    puts "Date: #{element.date}, Book \"#{element.book.title}\" by #{element.book.author}" if element.person.id == id
  end
end
