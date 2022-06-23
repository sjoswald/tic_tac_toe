class Tictacboard
  attr_accessor :grid

  def initialize (grid = [[1, 2, 3],[4, 5, 6],[7, 8, 9]] )
      @grid = grid
  end

  def cell_checker(x,y)
      @grid[x][y]
  end

  def x_player_mark(x,y)
      unless @grid[x][y] == "X" || @grid[x][y] == "O"
        @grid[x][y] = "X" 
      else
        print "Don't be silly! This square is taken."
      end
  end
end