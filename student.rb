require_relative './person' # Require the person.rb file

class Student < Person
  attr_reader :classroom

  def initialize(classroom, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
