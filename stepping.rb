class SteppingPieces < Piece
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
    when :n
      knight
    when :k
      king
    end
  end
  KNIGHTS = [
    [2,  1],
    [1,  2],
    [2, -1],
    [1, -2],
    [-2, 1],
    [-1, 2],
    [-2, -1],
    [-1, -2]
  ]
  def knight
    valid_moves = []

    KNIGHTS.each do |(x, y)|
      move = [@position.first + x, @position.last + y]
      location = @board.grid[move.first][move.last]
      if location.nil?
        valid_moves << move if @board.in_bounds?(move)
      else
        valid_moves << move if (@board.in_bounds?(move) && location.color != @color)
      end
    end
    valid_moves
  end

  KINGS = [
    [1,  1],
    [1, -1],
    [-1, 1],
    [-1,-1],
    [0,  1],
    [1,  0],
    [-1, 0],
    [0, -1]
  ]
  def king
    valid_moves = []

    KINGS.each do |(x, y)|
      move = [ @position.first + x, @position.last + y ]
      location = @board.grid[move.first][move.last]
      if location.nil?
        valid_moves << move if @board.in_bounds?(move)
      else
        valid_moves << move if (@board.in_bounds(move) && location.color != @color)
      end
    end
    valid_moves

  end



end
