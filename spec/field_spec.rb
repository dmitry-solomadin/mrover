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
      let(:rover) { Rover.new(1, 2, 'N') }
      let(:commands) { 'LMLMLMLMM' }

      it 'should execute rover w/o errors' do
        field.add_rover rover
        field.execute_rover 0, commands

        expect(rover.x).to be(1)
        expect(rover.y).to be(3)
      end
    end

    context 'with correct resulting data' do
      let(:rover) { Rover.new(1, 2, 'N') }
      let(:commands) { 'LMM' }

      it 'should raise exception' do
        field.add_rover rover
        expect { field.execute_rover 0, commands }.
          to raise_error(ArgumentError, 'Incorrect resulting rover position')

        expect(rover.x).to be(1)
        expect(rover.y).to be(3)
      end
    end
  end

end
