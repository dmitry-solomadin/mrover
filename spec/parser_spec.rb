require_relative '../parser'

describe Parser do

  describe '.parse' do
    context 'with correct data' do
      it 'returns parsed input' do
        parsed_input = Parser.parse(File.read('spec/fixtures/correct_input'))

        expect(parsed_input[:field_dimensions][:w]).to eq(5)
        expect(parsed_input[:field_dimensions][:h]).to eq(5)
        expect(parsed_input[:rovers].size).to eq(2)
        expect(parsed_input[:rovers][0][:x]).to eq(1)
        expect(parsed_input[:rovers][0][:y]).to eq(2)
        expect(parsed_input[:rovers][0][:direction]).to eq('N')
        expect(parsed_input[:rovers][0][:commands]).to eq('LMLMLMLMM')
        expect(parsed_input[:rovers][1][:x]).to eq(3)
        expect(parsed_input[:rovers][1][:y]).to eq(3)
        expect(parsed_input[:rovers][1][:commands]).to eq('MMRMMRMRRM')
      end
    end

    context 'with incorrect data - digits vs symbols' do
      it 'raises exception' do
        expect { Parser.parse(File.read('spec/fixtures/bad_input_digits')) }.to raise_error(ArgumentError)
      end
    end

    context 'with incorrect data - incorrect # of lines' do
      it 'raises exception' do
        expect { Parser.parse(File.read('spec/fixtures/bad_input_lines')) }.
          to raise_error(ArgumentError, 'Incorrect input - # of lines')
      end
    end

    context 'with incorrect data - field line size' do
      it 'raises exception' do
        expect { Parser.parse(File.read('spec/fixtures/bad_input_line_size_1')) }.
          to raise_error(ArgumentError, 'Incorrect input - field dimensions')
      end
    end

    context 'with incorrect data - field line size' do
      it 'raises exception' do
        expect { Parser.parse(File.read('spec/fixtures/bad_input_line_size_2')) }.
          to raise_error(ArgumentError, 'Incorrect input - rover position/heading')
      end
    end
  end

end
