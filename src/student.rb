require_relative 'person'

class Student < Person
  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, classroom, name = 'Unknown', parent_permission = true)
    # rubocop:enable Style/OptionalBooleanParameter
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
