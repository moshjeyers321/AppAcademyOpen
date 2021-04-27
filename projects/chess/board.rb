require_relative 'pieces'

class Board

  attr_reader :rows

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    rows[0][0] = Piece.new
    rows[5][0] = Piece.new
  end


  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    raise "There's no piece there" if self[start_pos] == nil
    raise "Position already taken" if self[end_pos].is_a?(Piece)


    self[start_pos], self[end_pos] = nil, self[start_pos]

  end

  def valid_pos?(pos)
    pos.all? { |val| val.between?(0,7) }
  end

end
