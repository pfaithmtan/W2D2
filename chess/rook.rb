require_relative 'piece.rb'
require 'byebug'

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