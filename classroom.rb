class Classroom
  attr_accessor :label, :students

  def initialize
    @label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end

# classroom = Classroom.new
# classroom.label = 'A-10'
# puts classroom.label
