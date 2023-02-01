class Person
  def initialize(name = "Unknown", age, parent_permission = true)
      @id = Random.rand(1..1000)
      @name = name
      @age = age
      @parent_permission = parent_permission
  end

  attr_reader :name
  attr_accessor :name
  attr_accessor :age

  def can_use_services?
    return true if is_of_age? || @parent_permission
    false
  end

  private

  def is_of_age?
    return true if @age >= 18
    false
  end   
end
  
  