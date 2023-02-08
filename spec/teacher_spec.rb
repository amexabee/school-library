require_relative '../src/teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new 30, 'Chemistry', 'Name'
  end
  describe 'Testing for Teacher Class' do
    it 'Take 3 parameters and return a Teacher object' do
      expect(@teacher).to be_instance_of Teacher
    end

    it 'Return the correct Name' do
      expect(@teacher.name).to eql 'Name'
    end

    it 'Return the correct Age' do
      expect(@teacher.age).to eql 30
    end

    it 'Return the correct Specialization' do
      expect(@teacher.specialization).to eql 'Chemistry'
    end

    it 'Check that can\t use service' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
