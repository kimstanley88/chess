require './piece.rb'


class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def populate
    pawn
    knight
    king
    bishop
    queen
    rook
  end

  def in_bounds?(pos)
    x, y = pos
    x.between?(0, 7) && y.between?(0,7)
  end

  def pawn
    @grid[1] = @grid[1].map { Piece.new(:p, :white, self) }
    @grid[6] = @grid[6].map { Piece.new(:p, :black, self) }
  end

  def rook
    @grid[0][0] = Piece.new(:r, :white, [0,0], self)
    @grid[0][7] = Piece.new(:r, :white, [0,7], self)
    @grid[7][0] = Piece.new(:r, :black, [7,0], self)
    @grid[7][7] = Piece.new(:r, :black, [7,7], self)
  end

  def knight
    @grid[0][1] = Piece.new(:n, :white, [0,1], self)
    @grid[0][6] = Piece.new(:n, :white, [0,6], self)
    @grid[7][1] = Piece.new(:n, :black, [7,1], self)
    @grid[7][6] = Piece.new(:n, :black, [7,6], self)
  end


  def bishop
    @grid[0][2] = Piece.new(:b, :white, [0,2], self)
    @grid[0][5] = Piece.new(:b, :white, [0,5], self)
    @grid[7][2] = Piece.new(:b, :black, [7,2], self)
    @grid[7][5] = Piece.new(:b, :black, [7,5], self)
  end

  def king
    @grid[0][4] = Piece.new(:k, :white, [0,4], self)
    @grid[7][4] = Piece.new(:k, :black, [7,4], self)
  end

  def queen
    @grid[0][3] = Piece.new(:q, :white, [0,3], self)
    @grid[7][3] = Piece.new(:q, :black, [7,3], self)
  end

  def move(start, end_pos)
    if @grid[start.first][start.last] == nil
      raise "no piece"
# fix these lines
    elsif @grid[end_pos.first][end_pos.last] != nil
      raise "not possible move"
    end
    @grid[end_pos.first][end_pos.last] = @grid[start.first][start.last]
    @grid[start.first][start.last] = nil
  end


end
