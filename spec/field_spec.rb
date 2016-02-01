require_relative '../field'
require_relative '../rover'

describe Field do

  describe '#add_rover' do
    let(:field) { Field.new(1, 1) }

    context 'with correct data' do
      it 'should add a rover' do
        field.add_rover Rover.new(1, 1, 'N')
        expect(field.rovers.size).to eq(1)
      end
    end

    context 'with incorrect initial data' do
      it 'should raise exception' do
        expect { field.add_rover Rover.new(2, 2, 'N') }.
          to raise_error(ArgumentError, 'Incorrect initial rover position')
      end
    end
  end


  describe '#execute_rover' do
    let(:field) { Field.new(5, 5) }
    context 'with correct data' do
      let(:rover_1) { Rover.new(1, 2, 'N') }
      let(:rover_2) { Rover.new(3, 3, 'E') }
      let(:commands) {  }

      it 'should execute rover w/o errors' do
        field.add_rover rover_1
        field.add_rover rover_2
        field.execute_rover 0, 'LMLMLMLMM'
        field.execute_rover 1, 'MMRMMRMRRM'

        expect(rover_1.x).to be(1)
        expect(rover_1.y).to be(3)
        expect(rover_1.direction).to be('N')

        expect(rover_2.x).to be(5)
        expect(rover_2.y).to be(1)
        expect(rover_2.direction).to be('E')
      end
    end

    context 'with incorrect resulting data' do
      let(:rover) { Rover.new(1, 2, 'N') }

      it 'should raise exception' do
        field.add_rover rover
        expect { field.execute_rover 0, 'LMM' }.
          to raise_error(ArgumentError, 'Incorrect resulting rover position')
      end
    end

    context 'with single incorrect resulting data' do
      let(:rover_1) { Rover.new(1, 2, 'N') }
      let(:rover_2) { Rover.new(1, 2, 'N') }

      it 'should raise exception' do
        field.add_rover rover_1
        field.add_rover rover_2

        field.execute_rover 0, 'MM'
        expect { field.execute_rover 1, 'LMM' }.
          to raise_error(ArgumentError, 'Incorrect resulting rover position')
      end
    end
  end

end
