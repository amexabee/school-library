require_relative '../src/person'

describe Person do
  before :each do
    @person = Person.new 11, 'Name', parent_permission: false
  end
  describe 'Testing for Person Class' do
    it 'Take 3 parameters and return a Person object' do
      expect(@person).to be_instance_of Person
    end

    it 'Return the correct Name' do
      expect(@person.name).to eql 'Name'
    end

    it 'Return the correct Age' do
      expect(@person.age).to eql 11
    end

    it 'Check that can\t use service' do
      expect(@person.can_use_services?).to be false
    end

    it 'Check of age will be > 18 and can use service' do
      @person = Person.new 19, 'Name', parent_permission: false
      expect(@person.can_use_services?).to be true
    end
  end
end
