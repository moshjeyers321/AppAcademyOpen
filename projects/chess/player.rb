require_relative 'display'

class Player

  attr_reader :color, :display
  
  def initialize(color, display)
    @color = color
    @display = display
  end

  def make_move(_board)
    start_pos, end_pos = nil, nil
    sleep 1.0
    until start_pos && end_pos
      display.render

      if start_pos
        puts "#{color}'s turn. Move to where?"
      end_pos = display.cursor.get_input

      # display.reset! if end_pos
      else
      puts "#{color}'s turn. Move to where?"
      start_pos = display.cursor.get_input
      
      # display.reset! if start_pos
      end
    end

    [start_pos, end_pos]
  end

end