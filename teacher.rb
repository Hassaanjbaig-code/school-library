require_relative './person' # Require the person.rb file

class Teacher < Person
  def initialize(specialization, name: 'Unknown', age: null, parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end