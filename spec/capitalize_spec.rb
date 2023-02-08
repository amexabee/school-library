require_relative '../src/capitalize'
require_relative '../src/person'

describe CapitalizeDecorator do
  before :each do
    @person = Person.new 20, 'name'
    @capitalize = CapitalizeDecorator.new @person
  end
  
  it 'Returns name capitalized' do
    expect(@capitalize.correct_name).to eql 'Name'
  end

end