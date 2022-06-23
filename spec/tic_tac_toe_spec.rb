require_relative '../tic_tac_toe.rb'

describe 'grid' do
    it 'is an array of length 9' do
        board=Tictacboard.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
        expect(board.grid.size).to eq(9)
        
    end
end

describe 'cell_checker' do
    it 'can retrieve contents of a cell' do
        board=Tictacboard.new([[1, 2, 3],[4, 5, 6],[7, 8, 9]])
        expect(board.cell_checker(1,1)).to eq(5)
    end
end

describe 'x_player_mark' do
    it 'can put an X in a cell' do
        board=Tictacboard.new([[1, 2, 3],[4, 5, 6],[7, 8, 9]])
        board.x_player_mark(0,1)
        expect(board.grid[0][1]).to eq("X")
        puts board.grid
    end
end