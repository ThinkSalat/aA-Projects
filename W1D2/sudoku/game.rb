require_relative "board"
class Game
  def initialize(board)
    @board = board 
  end 
  
  def play 
  end 
  
  def solved?
    @board.solved?
  end 
  
  
  def play_turn
  end 
  
  def [](pos)
    row, col = pos 
    @board.grid[row][col]
  end 
  
  def []=(pos, val)
    row, col = pos 
    @board.grid[row][col].value = val 
  end 
end 