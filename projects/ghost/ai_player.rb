# require_relative 'game.rb'
require 'byebug'
class AiPlayer

    attr_reader :name, :human

    ALPHABET = ('a'..'z').to_a

    def initialize
        @name = "Rob"
        @human = false
    end

    # def get_fragment(fragment)        #should be called in the game.rb and give it the current fragment
    #     @current_fragment = fragment
    # end

    def get_valid_moves(dictionary)
        #iterates through each letter of the alphabet and checks to see how many moves can be made after adding that letter
        #if the letter would make a word then we skip that letter
        #returns a hash where keys are the letters that don't make a word and values are how many possible moves can be made after using that letter
        #also removes any letters that don't have any possible moves after (those would be invalid moves)
        valid_moves = {}
        
        if @current_fragment == ''      #if ROB is the first player return a hash with all letters with value 1
            ALPHABET.each do |letter|
                valid_moves[letter] = 1
            end
            return valid_moves
        end
        
        
        ALPHABET.each do |letter|
            valid_moves[letter] = 0
        end
        
        ALPHABET.each do |guess|       
            test_string = @current_fragment+guess
            if !dictionary.include?(test_string)
                valid_moves[guess] =  dictionary.count {|word| word[0...test_string.length].include?(test_string)}
            end
        end

        if valid_moves.values.uniq.length > 1
           return valid_moves.keep_if {|letter,count| count > 0}
        else
            valid_moves
        end
    end
    
    def guess(fragment, dictionary)
        @current_fragment = fragment
        puts "THINKING... THINKING... THINKING"
        valid_moves = self.get_valid_moves(dictionary)
        sleep(1.0)
        best_val = valid_moves.min_by {|k,v| v}[-1]
        # debugger
        if best_val != 0 #if the given hash of valid moves has
            best_moves = valid_moves.select {|k,v| v == best_val}
            my_guess = best_moves.keys[rand(best_moves.length)]
            puts "MY GUESS IS #{my_guess}"
            return my_guess
        else
            puts "YOU HAVE BESTED ME"
            puts "MY GUESS IS #{valid_moves.key(0)}"
            return valid_moves.key(0)
        end
    end

end