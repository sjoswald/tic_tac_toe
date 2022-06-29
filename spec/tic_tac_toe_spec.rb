require_relative '../tic_tac_toe.rb'

describe 'grid' do
    it 'is an array of length 9' do
        board=Tictacboard.new()
        expect(board.grid.size).to eq(9)
        
    end
end

describe 'cell_checker' do
    it 'can retrieve contents of a cell' do
        board=Tictacboard.new()
        expect(board.cell_checker(5)).to eq(5)
    end
end

describe 'X player actions' do

    it 'can put an X in a cell' do
        board=Tictacboard.new()
        board.player_mark(1, "X")
        expect(board.grid[0]).to eq("X")
        puts board.grid
    end

    it 'can only put an X in an unplayed cell' do
        board=Tictacboard.new(["O", 2, 3, 4, 5, 6, 7, 8, 9])
        board.player_mark(1, "O")
        expect(board.grid[0]).to eq("O")
    end

    it 'shouts when you play a played cell' do
        board=Tictacboard.new(["O", 2, 3, 4, 5, 6, 7, 8, 9])
        expect{board.player_mark(1, "X")}.to output("Don't be silly! This square is taken.\n").to_stdout
    end
end 

describe 'O player actions' do
    it 'can put an O in a cell' do
        board=Tictacboard.new()
        board.player_mark(1, "O")
        expect(board.grid[0]).to eq("O")
        puts board.grid
    end

    it 'can only put an O in an unplayed cell' do
        board=Tictacboard.new(["X", 2, 3, 4, 5, 6, 7, 8, 9])
        board.player_mark(1, "O")
        expect(board.grid[0]).to eq("X")
    end

    it 'shouts when you play a played cell' do
        board=Tictacboard.new(["X", 2, 3, 4, 5, 6, 7, 8, 9])
        expect{board.player_mark(1, "O")}.to output("Don't be silly! This square is taken.\n").to_stdout
    end
end 

describe 'turn-tracking' do
    it 'knows when one turn has been played' do
        board=Tictacboard.new(["X", 2, 3, 4, 5, 6, 7, 8, 9])
        expect(turn_count(board)).to eq(1)
    end

    it 'knows when three turns have been played' do
        board=Tictacboard.new(["X", 2, "O", 4, 5, 6, "X", 8, 9])
        expect(turn_count(board)).to eq(3)
    end
    
    it 'knows when the board is full' do
        board=Tictacboard.new(["X", "X", "O", "O", "O", "X", "X", "X", "O"])
        expect(turn_count(board)).to eq(9)
    end
end

describe 'GAME-OVER' do
    it 'knows when player X won on the top row' do
        board=Tictacboard.new(["X", "X", "X", "O", 5, 6, "O", 8, 9])
        expect{board_state_checker(board)}.to output("Player X wins!\n").to_stdout
    end

    it 'knows when player O won on the first column' do
        board=Tictacboard.new(["O", "X", "X", "O", 5, 6, "O", 8, 9])
        expect{board_state_checker(board)}.to output("Player O wins!\n").to_stdout
    end

    it 'knows when player X won on the diagonal' do
        board=Tictacboard.new(["X", "O", "X", "O", "X", 6, "O", 8, "X"])
        expect{board_state_checker(board)}.to output("Player X wins!\n").to_stdout
    end

    it 'knows when player O won on the top row' do
        board=Tictacboard.new(["O", "O", "O", "X", 5, 6, "X", 8, 9])
        expect{board_state_checker(board)}.to output("Player O wins!\n").to_stdout
    end

    it 'knows when the board is full without a win' do
        board=Tictacboard.new(["X", "X", "O", "O", "O", "X", "X", "X", "O"])
        expect{board_state_checker(board)}.to output("It's a tie :(\n").to_stdout
    end
end     

describe 'taking turns' do
    it 'can produce next player symbol' do
        board=Tictacboard.new()
        expect(current_player(board)).to eq("X")
    end

    it 'can produce next player symbol' do
        board=Tictacboard.new(["O", "X", "X", "O", 5, 6, 7, 8, 9])
        expect(current_player(board)).to eq("X")
    end

    it 'can produce next player symbol' do
        board=Tictacboard.new(["O", "X", "X", "O", 5, 6, "X", 8, 9])
        expect(current_player(board)).to eq("O")
    end
end

describe 'displays the board!' do
    it 'prints the empty grid to the console' do
        board=Tictacboard.new()
        board_view = "\n 1 | 2 | 3\n ---------\n 4 | 5 | 6\n ---------\n 7 | 8 | 9\n"
        display(board)
        expect{display(board)}.to output(board_view).to_stdout
    end
end

