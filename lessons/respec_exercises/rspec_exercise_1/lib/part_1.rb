def average(n1, n2)
    return (n1+n2)/2.0
end

def average_array(arr)
    return (arr.sum)/(arr.length*1.0)
end

def repeat(str, num)
    # new_str = ""
    # num.times {|i| new_str += str}
    # new_str
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    # words = str.split
    words = str.split.map.with_index do |word, i|
        if i % 2 == 0
            word.upcase
        else
            word.downcase
        end
    end

    words.join(" ")
end
