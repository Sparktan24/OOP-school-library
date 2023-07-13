require_relative '../person'
require_relative '../rental'
require_relative '../book'

describe Person do
  book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
  person = Person.new(22, 'Larry Villegas')
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
          name: 'Larry Villegas',
          parent_permission: true
        }
      )
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eq('Larry Villegas')
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      expect(person.can_use_services?).to eq(true)
    end
  end

  describe '#of_age?' do
    it 'returns true if the person is of age' do
      expect(person.send(:of_age?)).to eq(true)
    end
  end
end
