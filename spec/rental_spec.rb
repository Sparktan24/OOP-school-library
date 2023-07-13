require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  describe '#to_json' do
    it 'returns a hash with the rental info' do
      book = Book.new('1984', 'George Orwell')
      person = Person.new(17, 'Jesus Molina')
      rental = Rental.new('2021-01-01', person, book)

      expect(rental.to_json).to eq(
        {
          book: '1984',
          person: 'Jesus Molina',
          date: '2021-01-01'
        }
      )
    end
  end
end
