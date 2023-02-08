require_relative '../src/trimmer'
require_relative '../src/person'

describe TrimmerDecorator do
  before :each do
    @person = Person.new 20, 'nameistoolong'
    @trimmer = TrimmerDecorator.new @person
  end
  
  it 'Returns trimmed name' do
    expect(@trimmer.correct_name).to eql 'nameistool'
  end

end