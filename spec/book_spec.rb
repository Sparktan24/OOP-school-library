require_relative '../book'
require_relative '../rental'
require_relative '../person'

describe Book do
  describe '#to_json' do
    it 'returns a Hash string' do
      book = Book.new('The Martian', 'Andy Weir')
      expect(book.to_json).to eq({ author: 'Andy Weir', title: 'The Martian' })
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the book' do
      person = Person.new(25, 'Larry Villegas')
      book = Book.new('The Martian', 'Andy Weir')
      rental = Rental.new('2015-01-01', person, book)
      book.add_rental(rental)
      expect(book.rentals).to include(rental)
    end
  end
end
