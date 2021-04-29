require 'colorize'
require_relative 'cursor'

class Display

  attr_reader :board, :cursor, :notifications

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @notifications = {"hello" => :hi}
  end

  def test_movement
    while true
      render
      @cursor.get_input
      if !board.valid_pos?(cursor.cursor_pos)
        break
      end
    end
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if cursor.cursor_pos == [i,j] && cursor.selected
      bg = :light_magenta
    elsif cursor.cursor_pos == [i, j]
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :green
    end
    { background: bg }
  end

  def render
    system("clear")
    build_grid.each { |row| puts row.join }

    @notifications.each do |_key, val|
      puts val
    end
  end

end