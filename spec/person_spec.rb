require_relative '../person'
require_relative '../rental'
require_relative '../book'

describe Person do
  book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
  person = Person.new(22, 'maximilianus')
  rental = Rental.new('2021-09-01', person, book)

  describe '#add_rental' do
    it 'add a rental to the person' do
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with the person information' do
      expect(person.to_hash).to eq(
        {
          type: 'Person',
          id: person.id,
          age: 22,
          name: 'maximilianus',
          parent_permission: true
        }
      )
    end
  end
end
