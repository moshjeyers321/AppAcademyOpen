require_relative 'pieces'

class Board

  attr_reader :rows
  attr_reader :empty_piece

  def initialize(fill_board = true)
    @empty_piece = NullPiece.instance
    @rows = Array.new(8) {Array.new(8, empty_piece)}
    fill_back_row(:white)
    fill_pawn_row(:white)
    fill_back_row(:black)
    fill_pawn_row(:black)

  end


  def [](pos)
    raise 'invalid pos' unless valid_pos?(pos)
    row, col = pos
    @rows[row][col]
  end
  
  def []=(pos, piece)
    raise 'invalid pos' unless valid_pos?(pos)
    row, col = pos
    @rows[row][col] = piece
  end

  def add_piece(piece, pos)
    raise 'position not empty' unless empty?(pos)

    self[pos] = piece
  end

  def move_piece(start_pos, end_pos)
    raise "There's no piece there" if self[start_pos] == nil
    raise "Position already taken" if self[end_pos].is_a?(Piece)

    self[start_pos], self[end_pos] = nil, self[start_pos]

  end

  def valid_pos?(pos)
    pos.all? { |val| val.between?(0,7) }
  end

  def dup
    new_board = Board.new(false)

    pieces.each do |piece|
      piece.class.new(piece.color, new_board, piece.pos)
    end

    new_board
  end    

  def empty?(pos)
    self[pos].empty?
  end

  def pieces
    @rows.flatten.reject(&:empty?)
  end

  private

  def fill_back_row(color)
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

    i = (color == :white ? 7 : 0)

    pieces.each_with_index do |piece_class, j|
      piece_class.new(color, self, [i, j])
    end
  end

  def fill_pawn_row(color)
    i = (color == :white ? 6 : 1)

    (0..7).each do |j|
      Pawn.new(color, self, [i,j])
    end
  end

end
