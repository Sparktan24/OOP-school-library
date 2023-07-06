require './person'
require './classroom'
require './student'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.add_student(self) # unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

# classroom = Classroom.new
# classroom.label = 'A-10'
# student_1 = Student.new(17, classroom, 'Sophie')
# puts student.play_hooky
# puts student
