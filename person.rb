require_relative './nameable'
require_relative './capitalizedecorator'
require_relative './trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age, :rental, :parent_permission
  attr_reader :id, :rentals

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
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
