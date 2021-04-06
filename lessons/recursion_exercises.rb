def range(start, end_)
  return [] if start >= end_

  [start] + range(start+1, end_)
end

def exp1(num, pow)
  return 1 if pow == 0
  num * exp1(num, pow-1)
end

def exp2(num, pow)
  return 1 if pow == 0
  return num if pow == 1

  if pow % 2 == 0
    tbd = exp2(num, pow/2)
    return tbd * tbd
  else
    tbd = exp2(num, (pow-1)/2)
    return num * (tbd*tbd)
  end

end

def deep_dup(arr) ######################################################
  dup = []
  arr.each do  |el|
    dup << el

  end
  # return dup if dup.none? { |el| el.is_a?(Array)}


end               ##################################################

