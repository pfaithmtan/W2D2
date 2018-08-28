require 'singleton'

class Piece 
  
  def initialize
    @color 
    @board 
    @pos 
  end
  
  def [](pos)
    x, y = pos 
    @board.grid[x][y]
  end 
  
  def []=(pos, value)
    x, y = pos 
    @board.grid[x][y] = value
  end 
  
  def to_s 
  end 
  
  def empty? 
  end 
  
  def valid_moves 
  end 
  
  def pos=(val)
  end 
  
  def symbol 
    :p
  end 
  
  private 
  def move_into_check?(end_pos) 
  end 
end 

module SlidingPiece 
  def horizontal_dirs 
  end 
  
  def diagonal_dirs
  end
  
  def moves 
  end 
  
  private
  HORIZONTAL_DIRS = []
  DIAGONAL_DIRS = []
  
  def move_dirs 
  end 
  
  def grow_unblocked_moves_in_dir(dx, dy)
  end 
end 

module SteppingPiece 
  def moves 
  end 
  
  private 
  def move_diffs
  end 
end 

class NullPiece < Piece 
  include Singleton
  
  def symbol 
    :n
  end 
end 