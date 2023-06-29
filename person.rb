class Person
  def initialize(age, name = 'Unknown', parent_permisson: true)
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

person = Person.new(17)

# person.name = "oliva"
puts person.can_use_services?
