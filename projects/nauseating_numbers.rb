require "byebug"

def strange_sums(array)
    count = 0
    array[0...array.length-1].each_with_index do |el1, i1|
        array[i1+1..-1].each do |el2|
            count += 1 if el1 + el2 == 0
        end
    end
    count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(array, product)

    array[0...array.length-1].each_with_index do |el1, i1|
        array[i1+1..-1].each do |el2|
            return true if el1 * el2 == product
        end
    end
    false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(string, hash)
    new_str = ''

    string.each_char do |char|
        if hash.has_key?(char)
            new_str += (char*hash[char])
        else
            new_str += char
        end
    end
    new_str
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(num)
    (0..num).each { |i| return true if i*i == num }
    false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

def get_factors(num)
    factors = []
    (1..num).each do |i|
        factors << i if num % i == 0
    end
    factors
end

def anti_prime?(num)
    (1...num).each do |i|
        return false if get_factors(i).length > get_factors(num).length
    end
    true

end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(matrix_1, matrix_2)
    new_matrix = Array.new(matrix_1.length) {Array.new(matrix_1.first.length)}
    new_matrix.each_with_index do |array, i1|
        array.each_with_index do |el, i2|
            new_matrix[i1][i2] = matrix_1[i1][i2] + matrix_2[i1][i2]
        end
    end
    new_matrix
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*nums)
    mutuals = []
    # mutuals << factor if nums.all?( |num| num % factor == 0) && (!mutuals.include(factor)))
    nums.each do |num|
        (1..num).each do |factor|
            mutuals << factor if nums.all?{ |i| i % factor == 0 && (!mutuals.include?(factor))}
        end
    end
    mutuals
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(num)
    return 1 if num == 1 or num == 2
    return 2 if num == 3
    tribonacci_number(num-1) + tribonacci_number(num-2) + tribonacci_number(num-3)
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*matrices)
    return nil if matrices.any? {|matrix| matrices[0].length != matrix.length}

    new_matrix = Array.new(matrices.first.length) {Array.new(matrices.first.first.length, 0)}

    matrices.each_with_index do |matrix, mi|
        matrix.each_with_index do |array, ai|
            array.each_with_index do |el, eli|
                new_matrix[ai][eli] += el
            end
        end
    end
    new_matrix
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(square)
    #if row.all? { |val| val == row[0]} TRUE
    #OR if array.transpose ^^
    
    square.each do |row|
        return true if row.uniq.count == 1
    end
    square.transpose.each do |col|
        return true if col.uniq.count == 1
    end

    false
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(square)
    # tbrange = (0...square.length).to_a
    btrange = (0...square.length).to_a.reverse
    tb = Array.new
    bt = Array.new

    btrange.each_with_index do |i1, i2|
        tb << square[i1][i1]
        bt << square[i2][i1]
    end

    return true if tb.uniq.count == 1 || bt.uniq.count == 1
    false
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

# def pascal_row(row)
#     ([0] + row).zip(row + [0]).map { |a,b| a+b }
# end

def adjacent_sums(arr)
    sums = []
    (0...arr.length-1).each do |i|
        sums << arr[i] + arr[i + 1]
    end
    sums
end

def pascals_triangle(num)
    triangle = [[1]]

    while triangle.length < num
        prev_level = triangle.last
        next_level = [1]
        next_level += adjacent_sums(prev_level)
        next_level << 1
        triangle << next_level
    end
    triangle
    
end


# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]

def prime?(num)
    return false if num < 2
    (2...num).none? { |f| num % f == 0 }
end

def mersenne_prime(num)
    count = 0
    x = -1
    y = 2**x -1
    while count < num
        x += 1
        y = 2**x -1
        count += 1 if prime?(y)
    end
    y
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_num(i)
    ((i * (i + 1)) / 2)
end

def triangular_num?(num)
    i = 1
    while i < num
        return true if triangular_num(i) == num
        i += 1
    end
    false
end

def word_to_int(word)
    alpha = ("a".."z").to_a
    lets = word.split("")
    sum = 0
    lets.each do |let|
        sum += alpha.index(let)+1
    end
    sum
end


def triangular_word?(word)
    triangular_num?(word_to_int(word))
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(array)
    new_arr = array.map {|el| el}

    i = 0
    while i < new_arr.length
        if (new_arr[i] + 1 == new_arr[i+1]) || (new_arr[i] - 1 == new_arr[i+1])
            new_arr.delete_at(i+1)
            new_arr.delete_at(i)
            i = 0
        else
            i += 1
        end
    end
    new_arr
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []



def get_closest_prime(num, n)
    count = n.abs
    i = 1
    if n < 0
        i = -i
    end
    candidate = num + i

    while count > 0
        if prime?(candidate)
            count -= 1
            prime = candidate
            candidate += i
        else
            candidate += i
            return nil if candidate < 2
        end
    end
    # return nil if prime < 2
    prime
end

def pretentious_primes(array, n)
    array.map {|el| get_closest_prime(el, n)}
end

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]