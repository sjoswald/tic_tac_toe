require_relative '../tic_tac_toe.rb'

describe 'grid' do
    it 'is an array of length 9' do
        board=Tictacboard.new()
        expect(board.grid.size).to eq(3)
        
    end
end

describe 'cell_checker' do
    it 'can retrieve contents of a cell' do
        board=Tictacboard.new()
        expect(board.cell_checker(1,1)).to eq(5)
    end
end

describe 'x_player_mark' do
    it 'can put an X in a cell' do
        board=Tictacboard.new()
        board.x_player_mark(0,1)
        expect(board.grid[0][1]).to eq("X")
        puts board.grid
    end

    it 'can only put an X in an unplayed cell' do
        board=Tictacboard.new([["O", 2, 3],[4, 5, 6],[7, 8, 9]])
        board.x_player_mark(0,0)
        expect(board.grid[0][0]).to eq("O")
    end

    it 'shouts when you play a played cell' do
        board=Tictacboard.new([["O", 2, 3],[4, 5, 6],[7, 8, 9]])
        expect{board.x_player_mark(0,0)}.to output("Don't be silly! This square is taken.").to_stdout
    end
end 