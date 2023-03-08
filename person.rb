require_relative './nameable'
require_relative './capitalizedecorator.rb'
require_relative './trimmer_decorator.rb'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    name
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correctname(name)
    name
  end
end


person = Person.new(22, name: 'maximilianus')
puts person.correct_name

capitalizedPerson = Capitalize.new(person)
puts capitalizedPerson.correct_name

capitalizedTrimmedPerson = Trimmer.new(capitalizedPerson)
puts capitalizedTrimmedPerson.correct_name