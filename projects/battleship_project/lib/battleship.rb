require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size/2
    end

    def start_game
        @board.place_random_ships
        puts "Number of ships remaining: #{@board.num_ships}"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        else
            return false
        end
    end

    def win?
        # ships = @board.num_ships
        if @board.num_ships == 0
            puts 'you win'
            return true
        else
            return false
        end
    end

    def game_over?
        self.win? || self.lose?
    end

    def turn
        position = @player.get_move
        @remaining_misses -= 1 if !@board.attack(position)
        @board.print
        puts "\nRemaining boats: #{board.num_ships}"
        puts "\nRemaining misses: #{@remaining_misses}"
    end

end
