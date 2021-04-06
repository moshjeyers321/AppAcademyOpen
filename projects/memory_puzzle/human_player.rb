

class HumanPlayer
  
  attr_accessor :previously_guessed_pos

  def initialize(size)
    @previously_guessed_pos = nil
  end

  def get_guess_pos
    print "Enter 2 numbers, separated by a space, as row col: "
    guessed_pos = gets.chomp

    convert_guess(guessed_pos)
  end

  def convert_guess(string)
    string.split(" ").map { |x| Integer(x)}
  end

  def receive_revealed_card(pos, value)
  end

  def receive_match(a, b)
  end

end