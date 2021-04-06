class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs
#############################################################################
  
def self.valid_pegs?(array)
    # array.each do |peg|
    #   if !POSSIBLE_PEGS.has_key?(peg.upcase)
    #     return false
    #   end
    # end
    # true
    array.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def self.random(length)
    array = []
    length.times do 
      array << POSSIBLE_PEGS.keys[rand(0...POSSIBLE_PEGS.length)]
    end

    secret_code = Code.new(array)

    secret_code
  end

  def self.from_string(string)
    code = Code.new(string.split(""))
    # code
  end

#############################################################################
  def initialize(chars)
    if Code.valid_pegs?(chars) == false
      raise "INVALID PEGS"
    else
      # @pegs = chars.map { |char| char.upcase }
      @pegs = chars.map(&:upcase)
    end
  end


  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess_code)
    correct = 0
    # secret = self.pegs
    # guess = guess_code.pegs
    
    # guess.each_with_index do |peg, i|
    #   correct += 1 if peg == secret[i]
    # end
    # correct
    (0...guess_code.length).each do |i|
      correct += 1 if @pegs[i] == guess_code[i]
    end
    correct
  end
  
  def num_near_matches(guess_code)
    near = 0
    # secret = self.pegs
    # guess_arr = guess_code.pegs

    # guess_arr.each do |peg|
    #   near += 1 if secret.include?(peg)
    # end
    # near - num_exact_matches(guess_code)
    (0...guess_code.length).each do |i|
      near += 1 if @pegs[i] != guess_code[i] && @pegs.include?(guess_code[i])
    end

    near
  end

  def ==(other_code)
    self.pegs == other_code.pegs
  end



end

