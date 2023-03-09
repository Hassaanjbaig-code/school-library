require_relative './nameable'
require_relative './capitalizedecorator'
require_relative './trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age, :rental
  attr_reader :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def correct_name
    name
  end

  def add_rental(rental)
    @rental.push(rental)
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

capitalizedperson = Capitalize.new(person)
puts capitalizedperson.correct_name

capitalizedtrimmedperson = Trimmer.new(capitalizedperson)
puts capitalizedtrimmedperson.correct_name
