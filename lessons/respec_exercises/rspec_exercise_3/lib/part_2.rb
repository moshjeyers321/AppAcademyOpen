def element_count(array)
    counts = Hash.new(0)
    array.each { |el| counts[el] += 1 }
    counts
end

def char_replace!(string, hash)

    string.each_char.with_index do |char, i|
        string[i] = hash[char] if hash.has_key?(char)
    end
    string
end

def product_inject(nums)
    product = nums.inject(1) { |memo, obj| memo * obj}
    product
end