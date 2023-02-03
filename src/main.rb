#!/usr/bin/env ruby
require_relative 'app'

def main
  puts "Welcome to School Library App!"
  app = App.new

  terminate = false
  while !terminate
  app.prompt()
  terminate = app.receive_input()
  end
end

main();


