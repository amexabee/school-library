require_relative '../student'
require_relative '../teacher'

def create_person
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  input = gets.chomp
  case input
  when '1'
    create_student
  when '2'
    create_teacher
  else
    puts "\n"
    puts 'Warning! Please provide a valid number'
  end
end

def create_student
  age = prompt_age
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission? [Y/N]: '
  gets.chomp
  student = Student.new(age, name)
  persons << student
  puts 'Student created successfully'
end

def create_teacher
  age = prompt_age
  print 'Name: '
  name = gets.chomp
  print 'Specialization: '
  specialization = gets.chomp
  teacher = Teacher.new(age, specialization, name)
  persons << teacher
  puts 'Teacher created successfully'
end

def prompt_age
  print 'Age: '
  num = gets.chomp
  age = num.to_i
  if age.zero?
    puts "\n"
    puts 'Warning! Please provide a valid age'
    prompt_age
  end
  age
end