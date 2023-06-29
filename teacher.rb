require './person'

class Teacher < Person
  def initialize(age, specialization)
    super(age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new(29, 'PE')
puts teacher.can_use_services?
