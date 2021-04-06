require 'byebug'

def duos(string)
    count = 0
    (0...string.length-1).each { |i| count += 1 if string[i] == string[i+1] }
    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sentence, hash)
    words = sentence.split(" ")

    words.map! do |word|
        if hash.has_key?(word)
            hash[word] 
        else
            word
        end
    end
    words.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, prc, &block)
    new_hash = {}
    hash.each { |k,v| new_hash[block.call(k)] = prc.call(v) }
    new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(string)
    hash = Hash.new {|h,k| h[k] = 0}
    array = []    
    
    string.each_char { |char| hash[char] += 1 }
    hash.keys.each { |key,v| array << key if hash[key] > 2 }

    array
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true?(string)
    count = 1
    # debugger
    (0...string.length-1).each do |i|
        if string[i] == string[i+1]
            count += 1 
        else
            count = 1
        end
        return true if count >= 3
    end

    count >= 3
end

# p triplet_true?('caaabb')        # true
# p triplet_true?('terrrrrible')   # true
# p triplet_true?('runninggg')     # true
# p triplet_true?('bootcamp')      # false
# p triplet_true?('e')             # false

def energetic_encoding(string, hash)
    new_string = ""

    string.each_char do |char|
        if hash.has_key?(char)
            new_string += hash[char]
        elsif char == " "
            new_string += " "
        else
            new_string += "?"
        end
    end

    new_string
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(string)
    uncompressed = ''
    alpha = ('a'..'z').to_a

    (0...string.length-1).each do |i|
        if alpha.include?(string[i])
            uncompressed += string[i] * string[i+1].to_i
        end
    end
    uncompressed
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(array, *procs)
    array.select do |el|
        procs.all? { |proc| proc.call(el)}
    end

end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def is_vowel?(char)
    vowels = 'aeiou'
    vowels.include?(char.downcase)
end

def piggify(word)
    return word if word.length < 3
    return word += 'yay' if is_vowel?(word[0])
    word.each_char.with_index do |char, i|
        return word[i..-1] + word[0...i] + "ay" if is_vowel?(char)
    end

end

# p piggify("apples")
# p piggify("ant")
# p piggify("at")
# p piggify("entering")
# p piggify("tertiary")

def convert_pig_latin(sentence)
    words = sentence.split(' ')
    words.map! do |word|
        if word == word.capitalize
            piggify(word).capitalize
        else
            piggify(word)
        end
    end
    words.join(" ")
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def word_reverb(word)
    return word if word.length <3
    return word + word.downcase if is_vowel?(word[-1])
    i = word.length - 1
    while i > 0
        return word + word[i..-1] if is_vowel?(word[i])
        i -=1
    end
end

def reverberate(sentence)
    new_sentence = sentence.split(" ").map {|word| word_reverb(word)}

    new_sentence.join(' ')
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(array, *procs)
    new_arr = []
    array.each do |el| 
        new_arr << el if procs.any? { |proc| proc.call(el)}
    end
    new_arr
end

longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def remove_first_vowel(word)
    word.each_char.with_index do |char,i|
        return word[0...i] + word[i+1..-1] if is_vowel?(char)
    end
end


def remove_last_vowel(word)
    word.reverse.each_char.with_index do |char,i|
        return (word.reverse[0...i] + word.reverse[i+1..-1]).reverse if is_vowel?(char)
    end
end

def alternating_vowel(sentence)
    words = sentence.split(' ')

    new_words = words.map.with_index do |word, i|
        # if i % 2 == 0
        #     remove_first_vowel(word)
        # else
        #     remove_last_vowel(word)
        # end
        i % 2 == 0 ? remove_first_vowel(word) : remove_last_vowel(word)
    end
    new_words.join(' ')
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sentence)
    words = sentence.split(' ')
    silly_words = []

    words.each do |word|
        if is_vowel?(word[-1])
            silly_words << word + word[-1]
        else
            new_word = ''
            word.each_char do |char|
                is_vowel?(char) ? new_word+= char + "b" + char : new_word += char
            end
            silly_words << new_word
        end
    end

    silly_words.join(' ')
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(string)
    compressed = ''
    count = 1
    (0...string.length).each do |i|
        if string[i] == string[i+1]
            count += 1
        else
            if count > 1
                compressed += string[i] + count.to_s
                count = 1
            else
                compressed += string[i]
            end
        end
    end
    compressed
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"