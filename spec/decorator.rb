require '../decorator'
require '../person'

describe Decorator do
  person = Person.new(22, 'maximilianus')
  describe 'Capitalize decorator' do
    it 'returns capitalize name' do
      capitalized_person = CapitalizeDecorator.new(person)
      expect(capitalized_person).to eq('Maximilianus')
    end
  end
end
