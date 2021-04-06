def is_prime?(num)
    return false if num < 2
    return false if (2...num).any? { |fact| num%fact==0}
    true
end

def nth_prime(n)
    primes = []
    i=0
    while primes.length < n
        if is_prime?(i)
            primes << i
        end
        i+=1
    end
    primes[-1]
end

def prime_range(min, max)
    primes = []
    (min..max).each { |num| primes << num if is_prime?(num) }
    primes
end