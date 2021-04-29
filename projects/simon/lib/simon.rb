require "colorize"

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
      system("clear") 
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    if !game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color.colorize(color)
      sleep 0.75
      system("clear")
      sleep 0.75
    end
  end

  def require_sequence
    puts "Enter the next color in the sequence:"

    @seq.each do |color|
      user_color = gets.chomp
      if color != user_color
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Nice round!"
  end

  def game_over_message
    puts "Whomp whomp!"
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end
