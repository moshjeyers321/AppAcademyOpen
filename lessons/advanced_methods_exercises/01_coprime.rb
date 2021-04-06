# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num1, num2)
    # div1 = get_divisors(num1)
    # div2 = get_divisors(num2)
    # # if num1.even? && num2.even?
    # #     return false
    # if div1.one? { |ele| div2.include?(ele)}
    #     return true
    # else
    #     return false
    # end

    (2..num1).none? {|factor| num1 % factor == 0 && num2 % factor == 0}


end

# def get_divisors(num)
#     divisors = []
#     (1..num).each do |x|
#         if num % x == 0
#          divisors << x
#         end
#     end
#     return divisors
# end


p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
