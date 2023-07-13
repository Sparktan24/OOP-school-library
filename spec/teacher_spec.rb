require_relative '../teacher'

describe Teacher do
  # specialization = Classroom.new
  describe 'can_use_services? method' do
    it 'returns permission true' do
      teacher = Teacher.new(39, 'Mage', 'Larry', parent_permission: true)
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
