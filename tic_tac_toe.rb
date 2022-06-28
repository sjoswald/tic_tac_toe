class Tictacboard
  attr_accessor :grid

  def initialize (grid = [1, 2, 3, 4, 5, 6, 7, 8, 9] )
      @grid = grid
  end

  def cell_checker(x)
      @grid[x-1]
  end

  def x_player_mark(x)
      unless @grid[x-1] == "X" || @grid[x-1] == "O"
        @grid[x-1] = "X" 
      else
        print "Don't be silly! This square is taken."
      end
  end

  def o_player_mark(x)
    unless @grid[x-1] == "X" || @grid[x-1] == "O"
      @grid[x-1] = "O"  
    else
      print "Don't be silly! This square is taken."
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
  $win_conditions.each { |win_combo|
  
    pos_1 = board.grid[win_combo[0]]
    pos_2 = board.grid[win_combo[1]]
    pos_3 = board.grid[win_combo[2]]

    if [pos_1, pos_2, pos_3].uniq.count == 1 
       print "Player #{pos_1} wins!"
    end
   } 
end