require_relative 'app'

def main
  puts 'Welcome to School Library App!'
  app = App.new

  terminate = false
  until terminate
    app.prompt
    terminate = app.receive_input
  end
end

main
