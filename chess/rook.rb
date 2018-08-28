require_relative 'piece.rb'
require_relative 'board.rb'

class Rook < Piece
  include SlidingPiece
  
  def initialize
    super(:white, [4, 4])
  end 
  
  def symbol
    :R
  end 
  
  protected
  
  def move_dirs 
    
  end
  
end 

if __FILE__ == $PROGRAM_NAME 
  board = Board.new
  rook = Rook.new
  rook.board = board
  p rook.horizontal_dirs
  p rook.vertical_dirs
  p rook.diagonal_dirs
end 