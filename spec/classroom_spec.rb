require_relative '../classroom'
require_relative '../student'

describe Classroom do
  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom = Classroom.new
      student = Student.new(17, classroom, 'Jesus Molina')
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
