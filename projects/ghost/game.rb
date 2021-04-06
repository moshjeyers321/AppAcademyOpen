require 'set'
require 'byebug'
require_relative 'human_player.rb'
require_relative 'ai_player.rb'

class Game
    attr_reader :dictionary, :players, :current_player, :previous_player, :fragment

    def initialize(*players)
        # @player_1 = HumanPlayer.new(players[0])
        # @player_2 = HumanPlayer.new(players[1])
        @players = []
        players.each do |player|
            @players << HumanPlayer.new(player)
        end
        @players << AiPlayer.new
        @current_player = @players[0]
        @previous_player = nil

        @losses = {}
        @players.each { |player| @losses[player] = 0 }

        @fragment = ''
        @dictionary = Set[]
        File.foreach('dictionary.txt') {|line| @dictionary << line.chomp}
    end

    def next_player! #will update the current player to the next player
        @players.rotate!
        @previous_player = @players[-1]
        @current_player = @players[0]
    end
    
    def valid_play?(string)
        if @dictionary.include?(string)
            puts "'#{string}' IS A WORD AND THEREFORE YOU LOSE"
            return false
        end
        count =  @dictionary.count {|word| word[0...string.length].include?(string)}
        
        # if @dictionary.count {|word| word[0...string.length].include?(string)}.length < 1
        if count < 1
            puts "Lol. Loser. There are #{count} words left"
            return false
        else
            puts "Good work. There are #{count} words left"
            return true
        end
    end
    
    def record(player)
        losing_word = "GHOST"
        if @losses[player] > 0
            return "#{player.name.capitalize} is a #{losing_word[0...@losses[player]]}"
        else
            return "#{player.name.capitalize} has done nothing wrong and we love them."
        end
    end
    
    def display_score
        puts '----------------------------------------'
        puts "The current score is: "
        @losses.each do |player, score|
            puts "  -  #{self.record(player)}"
        end        
        puts '----------------------------------------'
    end

    def take_turn(player) #will call the current player.guess and probably return their guess
        puts "The current word is: #{@fragment}"

        if player.human
            player_guess = player.guess
        else
            player_guess = player.guess(@fragment, @dictionary)
        end
        
        if valid_play?(@fragment+player_guess)
            @fragment += player_guess
            true
        else
            false
        end
    end
    
    def play_round
        while take_turn(@current_player)   #if the player makes a valid move and there are more moves to make...
            self.next_player!               #set the current player to the next
            true
        end                               #if not...
        puts "#{@current_player.name.capitalize}, you lose."
        @losses[@current_player] += 1
        self.next_player!
        @fragment = ''
        false
    end

    def run
        while @players.length > 1
            self.play_round
            sleep(0.5)
            self.display_score
            sleep(0.5)
            if @players.reject! {|player| @losses[player] == 5}
                puts "#{self.previous_player.name.capitalize} has been removed from the game!"
            end
            @losses.reject! {|player,score| score == 5}
        end
        puts '########################################'
        puts ""
        puts "#{@players[0].name.capitalize} is the winner!!!!"
        puts ""
        puts '########################################'
    end
end