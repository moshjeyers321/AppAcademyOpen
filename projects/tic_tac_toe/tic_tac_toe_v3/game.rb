require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'
# require 'daru'

class Game
    attr_reader :board

    def initialize(board_size, **players_hash) #accepts the board size AND a hash of players telling us if the player is human FALSE or computer TRUE
        # @players = player_marks.map { |mark| HumanPlayer.new(mark)}
        @players = []

        players_hash.each do |mark, type|
            type ? @players << ComputerPlayer.new(mark) : @players << HumanPlayer.new(mark)
        end

        @current_player = @players[0]

        @board = Board.new(board_size)

    end

    def switch_turn
        i = @players.index(@current_player)
        # @current_player = @players[ (i+1) % @players.length ]
        @current_player = @players.rotate![0]
    end

    def play
        while @board.empty_positions?
            @board.print
            # sleep(0.05)
            pos = @current_player.get_position(@board.legal_positions)
            @board.place_mark(pos, @current_player.mark)

            if @board.win?(@current_player.mark)
                @board.print
                p "Congratulations #{@current_player.mark}, you win!"
                return
            else
                switch_turn
            end
        end
        @board.print
        p "Looks like it's a draw. Do better next time!"
    end


end
