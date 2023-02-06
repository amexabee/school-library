def list_persons
  persons.each do |element|
    if element.is_a?(Student)
      puts "[Student] Name: #{element.name}, ID: #{element.id}, Age: #{element.age}"
    else
      puts "[Teacher] Name: #{element.name}, ID: #{element.id}, Age: #{element.age}"
    end
  end
end