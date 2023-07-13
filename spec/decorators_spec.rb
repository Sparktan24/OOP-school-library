require_relative '../decorators'
require_relative '../person'
require_relative '../nameable'

describe Decorator do
  describe '#correct_name' do
    it 'returns the correct name' do
      person = Person.new(17, 'John Doe')
      decorator = Decorator.new(person)
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end

describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'returns the correct name' do
      person = Person.new(17, 'john doe')
      decorator = CapitalizeDecorator.new(person)
      expect(decorator.correct_name).to eq('John doe')
    end
  end
end

describe TrimmerDecorator do
  describe '#correct_name' do
    it 'returns the correct name' do
      person = Person.new(17, 'Maximilianus')
      decorator = TrimmerDecorator.new(person)
      expect(decorator.correct_name).to eq('Maximilian')
    end
  end
end
