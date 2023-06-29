require "./person.rb"

class Student < Person
  def initialize(age, classroom)
    super(age)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

student = Student.new(17, "class")
puts student.play_hooky
