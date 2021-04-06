

class ComputerPlayer
  
  attr_accessor :previously_guessed_pos, :known_cards, :matched_cards
  attr_reader :size

  def initialize(size)
    @size = size
    @known_cards = {}
    @matched_cards = {}
    @previously_guessed_pos = nil
  end

  def receive_revealed_card(pos, value)
    known_cards[pos] = value
  end

  def receive_match(previous_guessed_pos, guessed_pos)
    @matched_cards[previously_guessed_pos] = true
    @matched_cards[guessed_pos] = true
  end

  def get_guess_pos
    if previously_guessed_pos
      second_guess
    else
      first_guess
    end
  end

  def unmatched_pos
    (pos, v) = @known_cards.find do |pos, val|
      @known_cards.any? do |pos2, val2|
        (pos != pos2 && val == val2) &&
        !(@matched_cards[pos] || @matched_cards[pos2])
      end
    end
    pos
  end
  
  def match_previous
    (pos, v) = @known_cards.find do |pos, val|
      pos != previously_guessed_pos && val == @known_cards[previously_guessed_pos] &&
      !@matched_cards[pos]
    end
    pos  
  end

  def first_guess
    unmatched_pos || random_guess
  end

  def second_guess
    match_previous || random_guess
  end



  def random_guess
    guess = nil
    until guess && !@known_cards[guess]
      guess = [rand(size), rand(size)]
    end
    guess
  end


end