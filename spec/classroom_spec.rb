require_relative '../src/classroom'
require_relative '../src/student'

describe ClassRoom do
  before :each do
    @classroom = ClassRoom.new 'label'
  end
  describe 'Testing for Classroom Class' do
    it 'Takes a parameter and returns a Classroom object' do
      expect(@classroom).to be_instance_of ClassRoom
    end

    it 'Return the correct label' do
      expect(@classroom.label).to eql 'label'
    end

    it 'Return the length of students rentals to be 1' do
      @student = Student.new 14, 'Name'
      @classroom.add_student(@student)
      expect(@classroom.students.length).to be 1
    end
  end
end
