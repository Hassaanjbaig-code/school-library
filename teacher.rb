require_relative './person' # Require the person.rb file

class Teacher < Person
  def initialize(specialization, age, name: 'Unknown')
    super(age, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
