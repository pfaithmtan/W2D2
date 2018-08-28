require_relative 'piece.rb'
require_relative 'board.rb'

class Knight < Piece
  include SteppingPiece
  
  def symbol
    :N
  end 
  
  protected
  
  def move_diffs
    [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end
  
end 