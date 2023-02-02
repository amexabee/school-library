require_relative 'base'
require_relative 'person'
require_relative 'trimmer'

class CapitalizeDecorator < BaseDecorator
  def initialize(nameable)
    super(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end
