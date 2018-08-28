require_relative 'piece.rb'
require_relative 'board.rb'

class King < Piece
  include SteppingPiece
  
  def symbol
    :K
  end 
  
  protected
  
  def move_diffs
    [[0, -1], [0, 1], [-1, 0], [1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]
  end
  
end 