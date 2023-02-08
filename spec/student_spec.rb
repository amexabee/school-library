require_relative '../src/student'

describe Student do
  before :each do
    @student = Student.new 11, 'Name'
  end
  describe 'Testing for Person Class' do
    it 'Take 3 parameters and return a Person object' do
      expect(@student).to be_instance_of Student
    end

    it 'Return the correct Name' do
      expect(@student.name).to eql 'Name'
    end

    it 'Return the correct Age' do
      expect(@student.age).to eql 11
    end

    it 'Check that can\t use service' do
      expect(@student.can_use_services?).to be true
    end

    it 'Check of age will be > 18 and can use service' do
      @student = Student.new 19, 'Name'
      expect(@student.can_use_services?).to be true
    end

    it 'Check the play_hooky method' do
        expect(@student.play_hooky).to eql '¯(ツ)/¯'
      end
  end
end
