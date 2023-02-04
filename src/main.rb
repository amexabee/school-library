require_relative 'app'

def main
  puts 'Welcome to School Library App!'
  app = App.new

  repeat = true
  while repeat
    app.prompt
    repeat = app.receive_input
  end
end

main
