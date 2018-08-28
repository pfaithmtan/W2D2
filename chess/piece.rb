require 'singleton'
require 'byebug'

class Piece 
  attr_accessor :pos, :board
  
  def initialize(color, pos)
    @color = color
    @board = nil
    @pos = pos
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
    raise "Not Implemented"
  end 
  
  def empty? 
  end 
  
  def valid_moves 
    raise "Not Implemented"
  end 
  
  def pos=(val)
    @pos = val
  end 
  
  def symbol 
    raise "Not Implemented"
  end 
  
  private 
  def move_into_check?(end_pos) 
  end 
end 

module SlidingPiece 
  def horizontal_dirs
    squares = []
    
    (0..7).each do |col|
      squares << [self.pos[0], col] unless col == self.pos[1]
    end 
    
    (0..7).each do |row|
      squares << [row, self.pos[1]] unless row == self.pos[0]
    end 
    
    squares
  end 
  
  def diagonal_dirs
    squares = []
    
    squares += diagonal_dir([1, 1])
    squares += diagonal_dir([1, -1])
    squares += diagonal_dir([-1, 1])
    squares += diagonal_dir([-1, -1])
    
    squares
  end
  
  def diagonal_dir(move)
    squares = []
    
    i = 1
    changed = true
    while changed
      changed = false
      new_row = self.pos[0] + i * move[0]
      new_col = self.pos[1] + i * move[1]
      new_pos = [new_row, new_col]
      if self.board.valid_pos?(new_pos)
        squares << new_pos 
        changed = true
      end 
      i += 1 
    end 
    
    squares
  end 
  
  def moves 
  end 
  
  private
  HORIZONTAL_DIRS = [[0, -1], [0, 1], [-1, 0], [1, 0]]
  DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]
  
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
  
  def initialize 
    super(nil, nil)
  end 
  
  def symbol 
    :n
  end 
end 