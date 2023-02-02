require_relative 'base'

class TrimmerDecorator < BaseDecorator
  def initialize(nameable)
    super(nameable)
    @nameable = nameable
  end

  def correct_name
    return @nameable.correct_name.slice(0, 10) if @nameable.correct_name.length > 10

    @nameable.correct_name
  end
end
