$vowels = "aeiou"

def hipsterfy(word)
    # vowels = "aeiou"
    i = word.length-1
    # arr = word.split("")

    # if arr.none? {|char| vowels.include?(char)}
    #    return word
    # end

    while i >=0
        if $vowels.include?(word[i])
            word[i] = ""
            # return arr.join
            return word
        end
        i -= 1
    end

    word
end

def vowel_counts(str)
    hash = Hash.new(0)

    str.downcase.each_char do |char|
        if $vowels.include?(char)
            # if !hash.has_key?(char)
            #     hash[char] = 1
            # else
            #     hash[char] += 1
            # end
            hash[char] += 1
        end
    end

    hash
end


def caesar_cipher(str, num)
    alphabet = ("abcdefghijklmnopqrstuvwxyz")
    # alphabet = ("a".."z").to_a.join ALSO WORKS. Ain't that neat
    new_str = ""
    str.each_char do |char|

        # print alphabet[alphabet.index(char)]
        # puts " " + alphabet[(alphabet.index(char)+num) % alphabet.length]
        # puts "----"
        if alphabet.include?(char)
            new_str += alphabet[(alphabet.index(char)+num) % alphabet.length]
        else
            new_str += char
        end
    end
    # p str
    new_str
end

# p caesar_cipher("123 _-!?@%", 3)