

class Card

  VALUES = ("A".."Z").to_a

  def self.shuffled_pairs(num_pairs)
    values = VALUES

    while num_pairs > values.length
      values += values
    end

    values = values.shuffle.take(num_pairs) * 2
    values.shuffle!
    values.map { |val| self.new(val) }
  end

  attr_reader :face_value

  def initialize(face_value, revealed = false)
    @face_value = face_value
    @revealed = revealed
  end

  def hide
    @revealed = false
  end

  def reveal
    @revealed = true
  end

  def revealed?
    @revealed
  end

  def to_s
    revealed? ? face_value.to_s : " "
  end

  def == (other_card)
    # @face_value == other_card.to_s
    other_card.is_a?(self.class) && other_card.face_value == face_value
  end

end