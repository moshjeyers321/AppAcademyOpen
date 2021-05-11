def bad_two_sum?(arr, target)
  
  (0...arr.length-1).each do |i|
    (i+1...arr.length).each do |i2|
      a, b = arr[i], arr[i2]
      return true if a + b == target
    end
  end

  false
end



arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target)

  arr = arr.sort
  i, j = 0, arr.length - 1

  while i < j 
    case (arr[i] + arr[j]) <=> target
    when 0
      return true
    when -1
      i += 1
    when 1
      j -= 1
    end
  end
  false
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target)
  hash = {}

  arr.each do |el|
    return true if hash[target - el]
    hash[el] = true
  end

  false

end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false