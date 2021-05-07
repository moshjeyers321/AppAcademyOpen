fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


def sluggish(fishes)
  big_fish = nil

  fishes.each do |fish1|
    fishes.each do |fish2|
      big_fish = fish1 if fish1.length > fish2.length
    end
  end
  big_fish
end

# p sluggish(fish)


def sluggish(fishes)

  fishes.each do |fish1|
    return fish1 if fishes.none? { |fish2| fish2.length > fish1.length}
  end
end

# p sluggish(fish)

def clever(fishes)
  biggest_fish = fishes[0]

  fishes.each do |fish|
    biggest_fish = fish if fish.length > biggest_fish.length
  end

  biggest_fish
end

# p clever(fish)


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, i|
    return i if tile == direction
  end
end

# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)

tiles_hash = {
  'up' => 0,
  'right-up' => 1,
  'right' => 2,
  'right-down' => 3,
  'down' => 4,
  'left-down' => 5,
  'left' => 6,
  'left-up' => 7,
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end

p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)