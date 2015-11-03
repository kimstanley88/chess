require './piece.rb'
require './board.rb'
require './cursorable.rb'


class Display
  include Cursorable

  attr_accessor :board, :cursor_pos
  def initialize(board)
    @board = board
    @cursor_pos = [0,0]
    @selected = false
  end

  def display
    @board.grid.each_with_index do |row, idx|
      puts display_row(row, idx)
    end
  end

  def display_row(row, idx)
    show = []
    row.each_with_index do |el, col|
      if el.nil? && @cursor_pos.first == idx && @cursor_pos.last == col
        show << '_'.colorize( background: :yellow)
      elsif el.nil?
        show << '_'
      elsif @cursor_pos.first == idx && @cursor_pos.last == col
        show << el.to_s.colorize( background: :yellow)
      else
        show << el
      end
    end
    show.join('  ')
  end

  def highlight
    while true
      display
      x = get_input
      @selected = !@selected if x == @cursor_pos
      # if get_input == "\r"
      #   @selected = true
      # end
      
      # system('clear')

    end
  end

end

x = Board.new
 x.populate
 show = Display.new(x)

show.highlight
