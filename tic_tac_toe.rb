class Tictacboard
  attr_accessor :grid

  def initialize (grid)
      @grid = grid        
  end

  def cell_checker(x,y)
      @grid[x][y]
  end

  def x_player_mark(x,y)
      @grid[x][y] = "X"
  end
end