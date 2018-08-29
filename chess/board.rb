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
    # First start with rooks -- place rooks in every corner, top two will be black, bottom two will be white
    # Next knights -- [0,1], [0,6] (black knights), [7,1], [7,6] (white knights)
    # Bishops -- [0,2], [0,5] (black bishops), [7,2], [7,5] (white bishops)
    # Queen -- [0,3] (black queen), [7,3] (white queen)
    # King -- [0,4] (black king), [7,4] (black king)
    # Populate row 6 with white pawns
    # Populate row 1 with black pawns 
    
    [[0,0], [0,7]].each { |pos| self[pos] = Rook.new(:black, pos, self) } #b_r_pos
    [[7,0], [7,7]].each { |pos| self[pos] = Rook.new(:white, pos, self) } #w_r_pos
    [[0,1], [0,6]].each { |pos| self[pos] = Knight.new(:black, pos, self) } #b_n_pos
    [[7,1], [7,6]].each { |pos| self[pos] = Knight.new(:white, pos, self) } #w_n_pos
    [[0,2], [0,5]].each { |pos| self[pos] = Bishop.new(:black, pos, self) } #b_b_pos
    [[7,2], [7,5]].each { |pos| self[pos] = Bishop.new(:white, pos, self) } #w_b_pos
    [[0,3]].each { |pos| self[pos] = Queen.new(:black, pos, self) } #b_q_pos
    [[7,3]].each { |pos| self[pos] = Queen.new(:white, pos, self) } #w_q_pos
    [[0,4]].each { |pos| self[pos] = King.new(:black, pos, self) } #b_k_pos
    [[7,4]].each { |pos| self[pos] = King.new(:white, pos, self) } #w_k_pos
    
    @grid[1].each_with_index { |square, i| square = Pawn.new(:black, [1,i], self) }
    @grid[6].each_with_index { |square, i| square = Pawn.new(:white, [6,i], self) }
    
    # self[0,0] = Rook.new(:black, [0,0], self)
    # self[0,7] = Rook.new(:black, [0,7], self)
    # self[7,0] = Rook.new(:white, [7,0], self)
    
    # [0, 1, 6, 7].each do |row_i|
    #   @grid[row_i].map!.with_index do |square, col_i|
    #     Piece.new(:piece, [row_i, col_i], self )
    #   end 
    # end 
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