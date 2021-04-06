def palindrome?(string)
    rev_string = []

    string.each_char {|char| rev_string.unshift(char)}
    
    rev_string = rev_string.join("")

    return true if rev_string == string
    false

end

def substrings(string)
    arr = []
    # letters = string.split("")


    # string.each_char.with_index do |char, i|
    #     letters.inject do |enum, el|
    #         p "current enum: " + enum
    #         print '"current array: "'
    #         p arr

    #         if !arr.include?(enum)
    #             arr << enum
    #         else
    #             enum += el
    #         end
    #         p "current enum after pass: " + enum
    #         print "current array after pass: "
    #         p arr
    #     end
    # end
    (0...string.length).each do |i1|
        (i1...string.length).each do |i2|
            arr << string[i1..i2]

        end
    end
    arr
end

def palindrome_substrings(string)
   
    # arr = []
    # substrings = substrings(string)

    # substrings.each do |string|
    #     if palindrome?(string) && string.length > 1
    #         arr << string
    #     end
    # end

    # arr
    
    substrings(string).select { |str| palindrome?(str) && str.length > 1}

end