# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def prime?(num)
    return false if num < 2

    (2...num).none? { |int| num % int == 0}

end

def largest_prime_factor(num)

    num.downto(2) do |factor|
        return factor if num % factor == 0 && prime?(factor)
    end

end

def unique_chars?(string)
    checked = []
    string.each_char do |char|
        if checked.include?(char)
            return false
        else
            checked << char
        end
    end

    true
end

def dupe_indices(array)
    dupes = Hash.new { |h, k| h[k] = [] }
    string = array.join("")

    array.each_with_index do |ele, i|
        dupes[ele] << i
    end

    dupes.each do |k,v|
        # debugger
        dupes.delete(k) if dupes[k].length == 1
    end

    # dupes
end

def ana_array(arr1, arr2)
    c1 = ele_counter(arr1)
    c2 = ele_counter(arr2)

    c1==c2

    # return false if arr1.length != arr2.length

    # arr1.each do |ele|
    #     return false if !arr2.include?(ele)
    # end

    # arr2.each do |ele|
    #     return false if !arr1.include?(ele)
    # end

    # true
end

def ele_counter(array)
    count = Hash.new(0)

    array.each { |ele| count[ele] += 1}

    count
end