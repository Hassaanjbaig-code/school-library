require_relative './person' # Require the person.rb file

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, name, age)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
