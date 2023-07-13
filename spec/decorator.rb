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

# person = Person.new(22, 'maximilianus')
# puts person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name
# puts person.can_use_services?
# puts person.correct_name