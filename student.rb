require './person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permisson: true)
    super(age, name, parent_permisson: parent_permisson)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

student = Student.new(17, 'class', 'Sophie', parent_permisson: false)
puts student.play_hooky
