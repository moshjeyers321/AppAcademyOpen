def mults(num)
  array = []

  (1...num).each do |fact|
    array << fact if (fact % 3 == 0) || (fact % 5 == 0)
  end
  array.sum
end

# p mults(10)
# p mults(1000)

def fibonacci(num)
  (1..num).inject( [0,1] ) { |fib| fib << fib.last(2).inject(:+) }

end

def even_fib(array)
  evens = []
  array.each do |el|
    evens << el if (el % 2 == 0) && el <= 4000000
  end
  evens.sum
end

# p fib = fibonacci(40)
# p even_fib(fib)

def is_prime?(num)
  return false if num <= 1

  (2...num).each do |fact|
    return false if num % fact == 0
  end

  true
end

def largest_prime_factor(num)
  test = 3
  out = 0
  while test <= num
    if ((num % test == 0) && is_prime?(test))
      out = test
      num = num/test
    end
    test += 1
  end
  return out
end

p largest_prime_factor(600851475143)