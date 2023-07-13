require_relative '../student'
require_relative '../classroom'

describe Student do
  classroom = Classroom.new
  describe '#play_hooky' do
    it 'returns the correct string' do
      student = Student.new(17, classroom, 'Jesus Molina', parent_permission: true)
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
