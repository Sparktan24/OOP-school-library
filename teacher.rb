require './person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permisson: true)
    super(age, name, parent_permisson: parent_permisson)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new(29, 'PE', 'Samuel', parent_permisson: false)
puts teacher.can_use_services?
