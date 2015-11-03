require 'colorize'

class Piece

  attr_reader :piece, :color

  def initialize(color, position, board = nil)
    @color = color
    @position = position
    @board = board
  end

  def inspect
    piece
  end

  def to_s
    if color == :white
      piece.to_s.colorize(:red)
    else
      piece.to_s.colorize(:blue)
    end
    #
    # return piece.to_s.colorize(:red) if color == :white
    # piece.to_s.colorize(:blue) if color == :black
  end

end
