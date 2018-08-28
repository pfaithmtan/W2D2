require_relative 'piece.rb'

class Knight < Piece
  include SteppingPiece
  
  def symbol
    if @color == :white
      ♘
    else
      ♞
    end
  end 
  
  protected
  
  def move_diffs
    [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end
  
end 