def my_min(arr)
  arr.each do |el1|
    return el1 if arr.none? { |el2| el2 < el1 }
  end
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)

def my_min(arr)
  lowest = arr.first
  
  arr.each do |el|
    lowest = el if el < lowest
  end
  
  lowest
end

# p my_min(list)



def largest_contiguous_subsum(arr)
  subs = []

  arr.each_index do |idx1|
    (idx1...arr.length).each do |idx2|
      subs << arr[idx1..idx2]
    end
  end
  subs.map { |sub| sub.inject(:+) }.max

end

list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list)


def largest_contiguous_subsum2(arr)

  largest = arr.first
  current = arr.first

  (1...arr.length).each do |i|
    p current
    current = 0 if current < 0
    current += arr[i]
    largest = current if current > largest
  end

  largest

end

p largest_contiguous_subsum2(list)