require_relative 'nameable'

class BaseDecorator < Nameable 
  def initialize(namable)
      @nameable = namable   
  end
  
  def correct_name
    @nameable.correct_name
  end
end