def windowed_max_range(arr, window_size)
  current_max_range = nil

  (0...arr.length).each do |i|
    break if i + window_size - 1 >= arr.size
    window = arr[i...i + window_size]
    range = window.max - window.min
    current_max_range = range if i == 0 || range > current_max_range
  end

  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8