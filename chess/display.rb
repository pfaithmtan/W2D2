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
    @board.grid.each_with_index do |row, row_i|
      row.each_with_index do |square, col_i|
        if [row_i, col_i] == @cursor.cursor_pos
          print "c".colorize(:red)
        else
          print square.symbol.to_s.colorize(:green)
        end
      end 
      print "\n"
    end 
  end 

end 

if __FILE__ == $PROGRAM_NAME 
  board = Board.new 
  display = Display.new(board)
  display.render
  
  while true 
    display.cursor.get_input
    display.render
    p display.cursor.cursor_pos
  end 
  
end 