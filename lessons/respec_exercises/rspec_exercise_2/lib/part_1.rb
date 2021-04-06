# def partition(arr, num)
#     # new_arr = Array.new(2, [])
#     less = []
#     more = []

#     arr.each do |el|
#         if el < num
#             less << el
#         else
#             more << el
#         end
#     end
#     new_arr = [less, more]
# end


def partition(arr, num)
    new_arr = Array.new(2) {[]}

    arr.each do |el|
        if el < num
            new_arr[0] << el
        else
            new_arr[1] << el
        end
    end

    new_arr
end

def merge(hash_1, hash_2)
    new_hash = Hash.new

    hash_1.each {|key, val| new_hash[key] = val}
    hash_2.each {|key, val| new_hash[key] = val}
    
    new_hash
end

def censor(sentence, curses)
    vowels = "aeiou"
    words = sentence.split(" ") # ["Gosh", "darn", "it"]

    words.map do |word|         # iterate through each word with map to make sure we are editing the word
        if curses.include?(word.downcase)   # if the downcase of the word is a curse . . .
            word.each_char.with_index do |char, i|  # go through each letter of the word
                if vowels.include?(char.downcase)   # if the letter is a vowel . . . 
                    word[i] = "*"                   # replace vowel with *
                else
                    word[i] = char                  # otherwise just pass the letter through
                end
            end
        end
    end

   words.join(" ")         #join the words back into a sentence
end

def power_of_two?(num)
    # 2, 4, 8, 16, 32, 64, 128, ...
    x = 1
    
    while x <= num
        return true if x == num
        x *= 2
    end

    false
end