class Person
  def initialize(age, name = "Unknown", parent_permisson = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permisson = parent_permisson
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    of_age? || @parent_permisson
  end

  private

  def of_age?
    @age >= 18
  end
end

class Student < Person
  def initialize(age, classroom)
    super(age)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

person = Person.new(17)
student = Student.new(17, "class")
# person.name = "oliva"
puts person.can_use_services?
puts student.play_hooky
