require_relative '../tic_tac_toe.rb'

describe 'We made a grid!' do
    it 'should make a 3 long array' do
        expect(grid.size).to eq(3)
    end

    it 'makes a 3 long sub array' do
        expect(grid[0].size).to eq(3)
    end
end