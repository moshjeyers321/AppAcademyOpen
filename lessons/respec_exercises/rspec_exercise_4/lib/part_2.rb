def proper_factors(num)
    factors = []
    (1..(num/2)).each { |factor| factors << factor if num%factor == 0 }
    factors
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    return true if num == aliquot_sum(num)
    false
end

def ideal_numbers(n)
    numbers = []
    i = 1
    while numbers.length < n
        numbers << i if perfect_number?(i)
        i += 1
    end
    numbers
end