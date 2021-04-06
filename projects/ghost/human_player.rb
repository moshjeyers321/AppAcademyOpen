class HumanPlayer

    attr_reader :name, :hu

    def initialize(name)
        @name = name
        @human = true
    end

    def guess
        alpha = ("a".."z").map {|letter| letter}
        print "\n#{@name.capitalize}, please enter a valid letter for your next guess: "
        
        player_guess = gets.chomp!.downcase

        if (player_guess.length > 1) || (!alpha.include?(player_guess))
            puts "Invalid guess... please try again\n"
            self.guess
        else
            return player_guess
        end
    end


end