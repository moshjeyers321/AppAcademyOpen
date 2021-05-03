require_relative 'board'
require_relative 'display'
require_relative 'cursor'
require_relative 'player'

class Game
  attr_accessor :board, :display, :players, :current_player

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    # @player_1 = Player.new(:white, display)
    # @player_2 = Player.new(:black, display)
    @players = { 
      white: Player.new(:white, @display),
      black: Player.new(:black, @display)
    }
    @current_player = :white

  end

  def play
    until board.checkmate?(current_player)
      begin
        start_pos, end_pos = players[current_player].make_move(board)
        board.move_piece(current_player, start_pos, end_pos)

        swap_turn!
        notify_players
      rescue StandardError => e
        @display.notifications[:error] = e.message
        retry
      end

    end

    display.render
    puts "THE GAME IS OVER. #{current_player} loses"

    nil
  end




  private

  def swap_turn!
    @current_player = (current_player == :white ? :black : :white)
  end

  def notify_players

  end

end

if $PROGRAM_NAME == __FILE__
  Game.new.play
end
