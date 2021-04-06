require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(guess_code)
        puts "Exact Matches: #{@secret_code.num_exact_matches(guess_code)} "
        puts "Near Matches: #{@secret_code.num_near_matches(guess_code)} "
    end

    def ask_user_for_guess
        print "Enter a code: "
        guess_code = Code.from_string(gets.chomp)
        self.print_matches(guess_code)

        @secret_code == guess_code
    end

end
