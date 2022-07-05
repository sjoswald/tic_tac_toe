class Tictacboard
  attr_accessor :grid

  def initialize (grid = [" "] * 9)
      @grid = grid
  end

  def cell_checker(x)
      @grid[x-1]
  end

  def player_mark(position, player)
    unless @grid[position-1] == "X" || @grid[position-1] == "O"
      @grid[position-1] = player
    else
      print "Don't be silly! This square is taken.\n"
    end
  end
end

def turn_count(board)
  count = 0
  board.grid.each { |square|
    if square == 'X' || square == 'O'
      count += 1
    end
  }
  count
end

$win_conditions = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [0, 4, 8],
  [2, 5, 8],
  [1, 4, 7],
  [2, 4, 6]
]

def board_state_checker(board)
  tie_flag = false
  win_flag = false
  $win_conditions.each { |win_combo|
  
    pos_1 = board.grid[win_combo[0]]
    pos_2 = board.grid[win_combo[1]]
    pos_3 = board.grid[win_combo[2]]

    if ["X", "O"].member?(pos_1) && [pos_1, pos_2, pos_3].uniq.count == 1 
       print "Player #{pos_1} wins!\n"
       win_flag = true
    elsif turn_count(board) == 9
        tie_flag = true
    end
    
   } 
   if tie_flag 
      print "It's a tie :(\n" 
   end
   if win_flag || tie_flag
    return true
   else 
    return false
   end
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def display(board)
  puts "\n #{board.grid[0]} | #{board.grid[1]} | #{board.grid[2]}"
  puts " ---------"
  puts " #{board.grid[3]} | #{board.grid[4]} | #{board.grid[5]}"
  puts " ---------"
  puts " #{board.grid[6]} | #{board.grid[7]} | #{board.grid[8]}"
end

def input_prompt(board)
  puts "Player #{current_player(board)}: Which square would you like to play?"
  square_to_play = gets.to_i
  if (1..9).member?(square_to_play)
    square_to_play
  else
    puts "No Player #{current_player(board)}! Pick a number between 1 and 9!"
  end
end

def game(board)
    board.player_mark(input_prompt(board), current_player(board))
    display(board)
end

# initialise running game method when running this script
if __FILE__ == $0
  board = Tictacboard.new
  display(board)
  while board_state_checker(board) == false
    game(board)
  end
end