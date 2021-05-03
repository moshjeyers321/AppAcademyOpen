require_relative 'pieces'

class Board

  attr_reader :rows
  attr_reader :empty_piece

  def initialize(fill_board = true)
    @empty_piece = NullPiece.instance
    @rows = Array.new(8) {Array.new(8, empty_piece)}
    make_starting_grid(fill_board)

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

  def move_piece(color, start_pos, end_pos)
    "No piece there" if empty?(start_pos)

    piece = self[start_pos]
    if piece.color != color
      raise "That's not your piece"
    elsif !piece.moves.include?(end_pos)
      raise "Piece cannot move there"
    elsif !piece.valid_moves.include?(end_pos)
      raise "you can't move into check"
    end

    move_piece!(start_pos, end_pos)
  end

  def move_piece!(start_pos, end_pos)
    piece = self[start_pos]
    raise "piece cannot move like that" unless piece.moves.include?(end_pos)

    self[end_pos] = piece
    self[start_pos] = empty_piece
    piece.pos = end_pos

    nil

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

  def checkmate?(color)
    return false unless in_check?(color)

    pieces.select { |p| p.color == color }.all? do |piece|
      piece.valid_moves.empty?
    end

  end

  def in_check?(color)
    king_pos = find_king(color).pos
    pieces.any? do |piece|
      piece.color != color && piece.moves.include?(king_pos)
    end
  end

  def find_king(color)
    # @rows.each do |row|
    #   row.each do |piece|
    #     return piece.pos if piece.color == color && piece.is_a?(King)
    #   end
    # end

    king = pieces.find { |piece| piece.color == color && piece.is_a?(King) }
    king || (raise "king not found?")
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

  def make_starting_grid(fill_board)
    return unless fill_board
    fill_back_row(:white)
    fill_pawn_row(:white)
    fill_back_row(:black)
    fill_pawn_row(:black)
  end

end
