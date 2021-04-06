def my_reject(array, &prc)
    new_arr = []
    array.each { |el| new_arr << el if !prc.call(el) }
    new_arr
end

def my_one?(array, &prc)
    test_arr = []
    array.each { |el| test_arr << el if prc.call(el) }
    return true if test_arr.length == 1
    false
end

def hash_select(hash, &prc)
    new_hash = Hash.new

    hash.each { |k,v| new_hash[k] = hash[k] if prc.call(k, v) }
    new_hash
end

def xor_select(array, prc_1, prc_2)
    new_arr = []
    array.each { |el| new_arr << el if (prc_1.call(el) && !prc_2.call(el)) || (!prc_1.call(el) && prc_2.call(el)) }
    new_arr
end

def proc_count(value, array)
    count = 0

    array.each { |prc| count += 1 if prc.call(value) }
    count
end