class Classroom
  attr_accessor :label

  def initialize
    @label
  end
end

classroom = Classroom.new
classroom.label = '100'
puts classroom.label
