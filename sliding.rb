class SlidingPieces < Piece
  attr_reader :color
  def initialize(type, color, position, board)
    @type = type
    @color = color
    @position = position
    @board = board
  end

  def moves
    move_dirs
  end

  def move_dirs
    case @type
    when :q
      diagonal + horiz_vert
    when :r
      horiz_vert
    when :b
      diagonal
    end
  end

DIAGONALS = [
  [1,  1],
  [1, -1],
  [-1, 1],
  [-1,-1]
]

  def diagonal
    valid_moves = []

    DIAGONALS.each do |(x, y)|
      pos = @position
      7.times do
        move = [x + pos.first, y + pos.last]
        location = @board.grid[move.first][move.last]
        if location.nil?
          break unless @board.in_bounds?(move)
          valid_moves << move
        else
          break unless @board.in_bounds?(move) && location.color == @color
          valid_moves << move
          break
        end
      end
    end
    valid_moves
  end

HORIZ_VERT = [
  [0,  1],
  [1,  0],
  [-1, 0],
  [0, -1]
]

  def horiz_vert
    valid_moves = []

    HORIZ_VERT.each do |(x, y)|
      pos = @position
      7.times do
        move = [x + pos.first, y + pos.last]
        location = @board.grid[move.first][move.last]
        if location.nil?
          break unless @board.in_bounds?(move)
          valid_moves << move
        else
          break unless @board.in_bounds?(move) && location.color == @color
          valid_moves << move
          break
        end
      end
    end
    valid_moves
  end


end
