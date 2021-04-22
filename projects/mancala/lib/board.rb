class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...13).each do |i|
      next if i == 6
      4.times do
        @cups[i] << :stone
      end
    end
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0,13)
      raise "Invalid starting cup"
    elsif @cups[start_pos].length < 1
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    moving_stones = []
    pos = start_pos
    moving_stones << @cups[start_pos].pop until @cups[pos].empty?

    until moving_stones.empty?
      pos = (pos + 1) % 14

      if current_player_name == @player1
        pos = (pos + 1) % 14 if pos == 13
      else
        pos = (pos + 1) % 14 if pos == 6
      end
      
      @cups[pos] << moving_stones.pop
    end

    render
    next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    return :draw if @cups[6].count == @cups[13].count

    @cups[6].count > @cups[13].count ? @player1 : @player2
  end
end
