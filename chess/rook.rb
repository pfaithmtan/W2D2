require_relative 'piece.rb'

class Rook < Piece
  include SlidingPiece
  
  def symbol
    if @color == :white
      ♖
    else
      ♜
    end
  end 
  
  protected
  
  def move_dirs 
    HORIZONTAL_DIRS
  end
  
end 

# if __FILE__ == $PROGRAM_NAME 
#   board = Board.new
#   rook = Rook.new
#   rook.board = board
#   p rook.horizontal_dirs
#   p rook.vertical_dirs
#   p rook.diagonal_dirs
# end 