require "byebug"

def reverser (string, &proc)
    new_str = ""

    string.each_char { |char| new_str.prepend(char) }
    proc.call(new_str)

end

def word_changer(string, &proc)
    words = string.split(" ")

    new_words = words.map { |word| proc.call(word)}

    new_words.join(" ")
end

def greater_proc_value(num, proc_1, proc_2)

    return proc_1.call(num) if proc_1.call(num) > proc_2.call(num)
    return proc_2.call(num) if proc_2.call(num) > proc_1.call(num)

end

def and_selector(array, proc_1, proc_2)
    new_array = []
    array.each do |ele|
        new_array << ele if proc_1.call(ele) && proc_2.call(ele)
    end

    new_array
end

def alternating_mapper(array, proc_1, proc_2)
    new_array = []

    array.each_with_index do |ele, i|
        if i.even?
            new_array << proc_1.call(ele)
        else
            new_array << proc_2.call(ele)
        end

    end

    new_array
end