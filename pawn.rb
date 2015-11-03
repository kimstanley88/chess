class Pawn < Piece
  attr_reader :color
  def initialize(color, position, board)
    @type = :p
    @color = color
    @position = position
    @board = board
  end

end
