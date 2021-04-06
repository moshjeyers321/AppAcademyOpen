def quick_sort(arr)
  return arr if arr.length <= 1
  pivot_arr = [arr.first]
  left_side = arr[1..-1].select { |el| el < arr.first}
  right_side = arr[1..-1].select { |el| el >= arr.first}
  quick_sort(left_side) + pivot_arr + quick_sort(right_side)
end

def sum_to(n)
  return 1 if n == 1
  return nil if n < 1
  n + sum_to(n-1)
end

def add_numbers(array)
  return array.first if array.length <= 1

  array.first + add_numbers(array[1..-1])
end

def gamma_fnc(num)
  return num if num == 1
  return nil if num < 1

  (num-1) * gamma_fnc(num-1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?

  return true if flavors.shift == favorite
  ice_cream_shop(flavors, favorite)
end

def reverse(string)
  return string if string.length <= 1

  string[-1] + reverse(string[0...-1])
end