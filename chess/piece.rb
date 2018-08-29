require 'singleton'
require 'byebug'

# class Board 
#   attr_accessor :grid
#   def initialize 
#     @grid = Array.new(8) { Array.new(8) }
#   end 
# 
#   def valid_pos?(pos)
#     row, col = pos 
#     size = @grid.count
#     return false unless (row.between?(0, size - 1) && col.between?(0, size - 1))
#     true
#   end 
# end

class Piece 
  attr_accessor :pos, :board, :color
  
  def initialize(color, pos, board)
    @color = color
    @board = board
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
    
    DIAGONAL_DIRS.each do |dir|
      squares += grow_unblocked_moves_in_dir(dir)
    end
    
    squares
  end
  
  def moves 
    moves = []
    
    self.move_dirs.each do |dir|
      moves += grow_unblocked_moves_in_dir(dir)
    end 
    
    moves
  end 
  
  private
  HORIZONTAL_DIRS = [[0, -1], [0, 1], [-1, 0], [1, 0]]
  DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]
  
  def move_dirs 
    raise "Not Implemented"
  end 
  
  def grow_unblocked_moves_in_dir(dir)
    squares = []
    
    i = 1
    changed = true
    while changed
      changed = false
      new_row = self.pos[0] + i * dir[0]
      new_col = self.pos[1] + i * dir[1]
      new_pos = [new_row, new_col]
      if self.board.valid_pos?(new_pos)
        squares << new_pos 
        changed = true
      end 
      i += 1 
    end 
    
    squares
  end 
end 

module SteppingPiece 
  def moves 
    moves = [] 
    self_row, self_col = self.pos
    
    self.move_diffs.each do |move|
      moves << [self_row + move[0], self_col + move[1]]
    end 
    
    moves    
  end 
  
  private 
  def move_diffs
    raise "Not Implemented"
  end 
end 

class NullPiece < Piece 
  include Singleton
  
  def initialize 
    # super(nil, nil)
  end 
  
  def moves 
    []
  end 
  
  def symbol 
    " "
  end 
end 