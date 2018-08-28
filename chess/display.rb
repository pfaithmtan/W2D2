require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'

class Display
  attr_accessor :board, :cursor 
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
  
  def render 
    
  end 

end 