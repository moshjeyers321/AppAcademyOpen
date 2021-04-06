# require_relative 'board.rb'

class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        alpha = ('a'..'z').map {|let| let}

        p "Player #{@mark}, please enter a position as two numbers separated by a space as ROW COL (ex: 1 2)"
        entered_pos = gets.chomp!.split(" ")

        if entered_pos.length != 2
            raise "Incorrect amount of numbers added"
        elsif entered_pos.any? { |el| alpha.include?(el.downcase)}
            raise "That's not a number ya dingus!"
        else
            entered_pos.map! {|num| num.to_i}
        end
    end

end