def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each { |el| hash[el] += 1 }
    hash.keys.select { |k| hash[k] == 1 }
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length-1).each do |i|
        return false if arr[i] == arr[i+1]
    end
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new { |h, k| h[k] = Array.new}

    str.each_char.with_index { |char, i| hash[char] << i }

    hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    hash = Hash.new(0)

    str.each_char do |char|
        hash[char] += 1
    end
    sorted = hash.sort_by {|k,v| v}

    p sorted[-1][0] * sorted[-1][1]

end

# longest_streak('a')           # => 'a'
# longest_streak('accccbbb')    # => 'cccc'
# longest_streak('aaaxyyyyyzz') # => 'yyyyy
# longest_streak('aaabbb')      # => 'bbb'
# longest_streak('abc')         # => 'c'

def prime?(num)
    (2...num).each do |i|
        return false if num % i == 0
    end
    true
end


def bi_prime?(num)  #returns a boolean telling if the given num is a product of 2 primes
    primes = []
    (2...num).each do |i|
        primes << i if prime?(i)
    end
    
    primes.each do |num1|
        primes.each do |num2|
            return true if num1 * num2 == num
        end
    end
    false
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false
class String
    def caesar_cipher(num)
        alpha = ("a".."z").to_a
        new_str = ""
        self.each_char do |char|
            i = alpha.index(char)
            shift = (i+num)%26
            new_str += alpha[shift]
        end
        new_str
    end
end

def vigenere_cipher(message, keys)
    coded = ""
    long_key = []
    while long_key.length <= message.length
        long_key += keys
    end
    message.each_char.with_index do |char, i|
        coded += char.caesar_cipher(long_key[i]) #use the caesar cipher on each char. the cipher will adjust for each i
    end
    coded
end

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def is_vowel?(char)
    vowels = "aeiou"
    vowels.include?(char)
end

def vowel_rotate(str)
    word_vowels = []
    new_str = ""
    
    str.each_char do |char|     #grabbing all the vowels in the given string
        word_vowels << char if is_vowel?(char)
    end

    word_vowels.rotate!(-1)     #rotating the vowels in the given string
    # p word_vowels

    i = 0               #setting the start index for the rotated vowels

    str.each_char do |char|     #iterate through each letter in the string
        if is_vowel?(char)      #if the letter is a vowel
            new_str += word_vowels[i]   #assign it to its rotated vowel index
            i += 1                      #next index
        else
            new_str += char
        end
    end
    
    p new_str
end

# vowel_rotate('computer')      # => "cempotur"
# vowel_rotate('oranges')       # => "erongas"
# vowel_rotate('headphones')    # => "heedphanos"
# vowel_rotate('bootcamp')      # => "baotcomp"
# vowel_rotate('awesome')       # => "ewasemo"

class String

    def select(&prc)
        prc ||= Proc.new {false}
        new_str = ""
        self.each_char do |char|
            new_str += char if prc.call(char)
        end
        new_str
    end

    def map!(&prc)
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, *i)

        end
    end

end

# #String::SELECT EXAMPLES
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# #String::map!Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(num1, num2)

    return 0 if num1 == 0 || num2  == 0

    # if (num1 >= 0 && num2 >=0)
    #     num1 + multiply(num1, num2-1)
    # elsif num1 < 0 && num2 < 0
    #     -num1 + multiply(num1, num2+1)
    # elsif num2 < 0
    #     -num1 + multiply(num1, num2+1)
    if num2 < 0
        -(num1 + multiply(num1, -num2 - 1))
    else
        num1 + multiply(num1, num2-1)
    end

end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2, 1] if num == 2

    seq = []
    # seq += (lucas_sequence(num-1) + [lucas_sequence(num-1)[-1] + lucas_sequence(num-1)[-2]])
    seq += (lucas_sequence(num-1) + [lucas_sequence(num-1).last(2).sum])
    # seq
end 

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    primes = []
    return [num] if prime?(num)

    (2...num).each do |i|
        if prime?(i) && num % i == 0
            return (primes << [i, prime_factorization(num/i)]).flatten
        end
    end

end

# Examples
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]