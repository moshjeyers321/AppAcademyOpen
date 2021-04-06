require_relative 'board.rb'
require_relative 'human_player.rb'

class Game

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @players = [@player_1, @player_2]
        @current_player = @players[0]
    end

    def switch_turn
        i = @players.index(@current_player)
        @current_player = @players[ (i+1) % @players.length ]
    end

    def play

        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)

            if @board.win?(@current_player.mark)
                p "Congratulations #{@current_player.mark}, you win!"
                return
            else
                switch_turn
            end
        end

        p "Looks like it's a draw. Do better next time!"
    end


end