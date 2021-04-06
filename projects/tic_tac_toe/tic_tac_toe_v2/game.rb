require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'
# require 'daru'

class Game
    attr_reader :board

    def initialize(board_size, *player_marks)
        # @player_1 = HumanPlayer.new(player_1_mark)
        # @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new(board_size)
        @players = player_marks.map { |mark| HumanPlayer.new(mark)}
        @current_player = @players[0]
    end

    def switch_turn
        i = @players.index(@current_player)
        # @current_player = @players[ (i+1) % @players.length ]
        @current_player = @players.rotate![0]
    end

    def play

        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)

            if @board.win?(@current_player.mark)
                @board.print
                p "Congratulations #{@current_player.mark}, you win!"
                return
            else
                switch_turn
            end
        end

        p "Looks like it's a draw. Do better next time!"
    end


end