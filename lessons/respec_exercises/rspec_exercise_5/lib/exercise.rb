def zip(*arrays)
    new_arr = Array.new(arrays[0].length) {Array.new}
    
    arrays.each do |array|
        array.each_with_index do |el, i2|
            new_arr[i2] << el
        end
    end
    new_arr

end

def prizz_proc(array, prc_1, prc_2)
    new_arr = []
    # array.each { |el| new_arr << el if (prc_1.call(el) && !prc_2.call(el)) || (!prc_1.call(el) && prc_2.call(el)) }
    array.each { |el| new_arr << el if prc_1.call(el) ^ prc_2.call(el)}
    new_arr
end

def zany_zip(*arrays)
    longest = 0
    arrays.each { |array| longest = array.length if array.length > longest}
    new_arr = Array.new(longest) {Array.new(arrays.length, nil)} # new_array should be a 2d array where self.length is the length of the longest given array, and sub arrays.length is how many arrays are given

    arrays.each_with_index do |array, i1|
        array.each_with_index do |el, i2|
            new_arr[i2][i1]  = el
        end
    end
    new_arr
end

def maximum(array, &prc)
    return nil if array.empty?
    max = array[0]
    array.each { |el| max = el if prc.call(max) <= prc.call(el) }
    max
end

def my_group_by(array, &prc)
    hash = Hash.new { |h, k| h[k] = Array.new}
    array.each { |el| hash[prc.call(el)] << el }
    hash
end

def max_tie_breaker(array, prc, &block)
    return nil if array.empty?

    largest = array[0]
    array.each do |el|
        comp = block.call(largest) <=> block.call(el)
        if comp == -1
            largest = el
        elsif comp == 0
            largest = el if prc.call(largest) < prc.call(el)
        end
    end
    largest
end

def silly_syllables(sentence)
    words = sentence.split(" ")
    new_words = words.map do |word|
        num_vowels = vowel_count(word)
        if vowel_count(word) > 1
            word_changer(word)
        else
            word
        end
    end
    new_words.join(" ")

end

def word_changer(word)
    indices = vowel_indices(word)
    word[indices.first..indices.last]
end

def vowel_indices(word)
    indices = []
    word.each_char.with_index do |char, i|
        indices << i if vowel?(char)
    end
    indices
end

def vowel?(char)
    vowels = 'aeiou'
    vowels.include?(char.downcase)
end

def vowel_count(word)
    count = 0
    word.each_char { |char| count += 1 if vowel?(char)}
    count
end