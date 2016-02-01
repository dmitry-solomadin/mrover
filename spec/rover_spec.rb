require_relative '../rover'

describe Rover do

  describe '#initialize' do
    context 'with correct data' do
      it 'should initialize a rover' do
        rover = Rover.new(1, 1, 'N')
        expect(rover.x).to eq(1)
        expect(rover.y).to eq(1)
        expect(rover.direction).to eq('N')
      end
    end

    context 'with incorrect position' do
      it 'should raise exception' do
        expect { Rover.new(1, 'A', 'N') }.to raise_error(ArgumentError)
      end
    end

    context 'with incorrect direction' do
      it 'should raise exception' do
        expect { Rover.new(1, 1, 'F') }.to raise_error(ArgumentError, 'Invalid direction')
      end
    end
  end

  describe '#execute_command' do
    let(:rover) { Rover.new(1, 1, 'N') }

    context 'with move command' do
      it 'should move north' do
        rover.execute_command('M')
        expect(rover.x).to eq(1)
        expect(rover.x).to eq(2)
        expect(rover.direction).to eq('N')
      end
    end

    context 'with rotate left command' do
      it 'should rotate to west' do
        rover.execute_command('L')
        expect(rover.x).to eq(1)
        expect(rover.x).to eq(1)
        expect(rover.direction).to eq('W')
      end
    end

    context 'with rotate right command' do
      it 'should rotate east' do
        rover.execute_command('R')
        expect(rover.x).to eq(1)
        expect(rover.x).to eq(1)
        expect(rover.direction).to eq('E')
      end
    end

    context 'with multiple rotate&move command' do
      it 'should move 2 times north' do
        rover.execute_command('R')
        rover.execute_command('R')
        rover.execute_command('R')
        rover.execute_command('R')
        rover.execute_command('M')
        rover.execute_command('M')
        expect(rover.x).to eq(1)
        expect(rover.x).to eq(2)
        expect(rover.direction).to eq('N')
      end
    end

    context 'with incorrect command' do
      it 'should raise exception' do
        expect { rover.execute_command('F') }.
          to raise_error(ArgumentError, 'Incorrect command')
      end
    end
  end

end
