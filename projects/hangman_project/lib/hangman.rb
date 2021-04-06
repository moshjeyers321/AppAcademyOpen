class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza", ]

  def self.random_word
    chosen_word = DICTIONARY.sample
  end

  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {'_'}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
    
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end
  
  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end
  
  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    matching_indices = []
    @secret_word.each_char.with_index { |el, i| matching_indices << i if char == el }
    matching_indices
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "That guess has already been attempted"
      return false
    end

    @attempted_chars << char
    
    matches = get_matching_indices(char)
    
    fill_indices(char, matches)
    
    @remaining_incorrect_guesses -= 1 if matches.length == 0
    
    return true

  end

  def ask_user_for_guess
    print "Enter a char:"
    # guess = gets.chomp
    try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join == @secret_word
      puts 'WIN' 
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      true
    else
      false
    end
  end





end
