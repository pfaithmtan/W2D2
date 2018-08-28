require_relative 'piece.rb'

class Board 
  attr_accessor :grid
  
  def initialize(size = 8) 
    @grid = Array.new(size) { Array.new(size) { NullPiece.instance } }
    populate_board
  end 
  
  def [](pos)
    row, col = pos 
    @grid[row][col]
  end 
  
  def []=(pos, val)
    row, col = pos 
    @grid[row][col] = val
  end 
  
  def populate_board 
    [0, 1, 6, 7].each do |row_i|
      @grid[row_i].map! do |square|
        Piece.new
      end 
    end 
  end 
  
  def move_piece(start_pos, end_pos)
    raise "invalid start position" if self[start_pos].nil?
    raise "invalid ending position" unless valid_end_pos?(end_pos)
    
    pick_up = self[start_pos]
    self[start_pos] = nil 
    self[end_pos] = pick_up
  end 
  
  def valid_end_pos?(pos)
    row, col = pos 
    return false unless (valid_pos?(pos) && self[pos].nil?)
    true
  end
  
  def valid_pos?(pos)
    row, col = pos 
    size = @grid.count
    return false unless (row.between?(0, size - 1) && col.between?(0, size - 1))
    true
  end 
end 