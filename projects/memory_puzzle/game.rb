require_relative 'board.rb'
require_relative "human_player"
require_relative "computer_player"

class Game

  attr_reader :player

  def initialize(player, size = 4)
    # p "Enter an even number of at least 4 for the size of the board"
    @board = Board.new(size)
    @previously_guessed_pos = nil
    @player = player
    # play
  end

  def valid_pos?(pos)
    pos.is_a?(Array) &&
      pos.count == 2 &&
      pos.all? { |x| x.between?(0, board.size-1)}
  end

  # def get_guess_pos
  #   print "Enter 2 numbers, separated by a space, as row col: "
  #   guessed_pos = gets.chomp
  #   convert_guess(guessed_pos)
  # end

  # def convert_guess(string)
  #   string.split(" ").map { |x| Integer(x)}
  # end

  def compare_guess(guessed_pos)
    if previously_guessed_pos
      if match?(previously_guessed_pos, guessed_pos) && (previously_guessed_pos!= guessed_pos)
        player.receive_match(previously_guessed_pos, guessed_pos)
        puts "That's a match!"
      else
        if (previously_guessed_pos == guessed_pos)
          puts "That's the same guess, dummy!"
        else
          puts "Not a match, try again."
        end
        board[previously_guessed_pos].hide
        board[guessed_pos].hide
      end
      self.previously_guessed_pos = nil
      player.previously_guessed_pos = nil
    else
      self.previously_guessed_pos = guessed_pos
      player.previously_guessed_pos = guessed_pos
    end

  end
  
  def make_guess(pos)
    revealed_value = board.reveal(pos)
    player.receive_revealed_card(pos, revealed_value)
    board.render
    
    compare_guess(pos)
    # puts "Known positions #{player.known_cards}"
    sleep(0.25)
    board.render
  end

  def match?(pos1, pos2)
    board[pos1] == board[pos2]
  end

  def play
    until board.won?
      board.render
      # puts "Known positions #{player.known_cards}"
      guessed_pos = player.get_guess_pos
      make_guess(guessed_pos)
    end
    puts "YOU DID IT YOU SALTY SON OF A BITCH"
  end

  private

  attr_reader :board
  attr_accessor :previously_guessed_pos
end

if $PROGRAM_NAME == __FILE__
  size = ARGV.empty? ? 4 : ARGV.shift.to_i
  Game.new(ComputerPlayer.new(size), size).play
end