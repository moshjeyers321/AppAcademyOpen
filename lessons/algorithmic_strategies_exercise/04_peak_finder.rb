# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr)
    peak_arr = []

    # arr.each_with_index do |val, i|
    #     if i == 0 && val > arr[i+1]
    #         peak_arr << val

    #     elsif i == arr.length-1 && val > arr[-2]
    #         peak_arr << val

    #     elsif val > arr[i+1] && val > arr[i-1]
    #         peak_arr << val
    #     end
    # end

    (0..arr.length-1).each do |i|
        if i == arr.length-1 # if we are at the end . . .
            if arr[i] > arr[-2]
             peak_arr << arr[i]
            end
            break # GTFO
        elsif i == 0 && arr[i] > arr[i+1] # if it's the beginning . . .
            peak_arr << arr[i]
        elsif arr[i] > arr[i+1] && arr[i] > arr[i-1] # everything else . . .
            peak_arr << arr[i]
        end
    end
    peak_arr
end


p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]
