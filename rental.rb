class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book

    person.add_rental(self)
    book.add_rental(self)
  end
end
# IRB
# require './rental'
# require './book'
# require './person'
# person = Person.new(22, 'maximilianus')
# book1 = Book.new("Book 1", "Author 1")
# rental1 = Rental.new("2023-05-06", person1, book1)
# person.rentals
# book1.rentals
# rental1.person.name
# rental1.book.title
# rental1.date
