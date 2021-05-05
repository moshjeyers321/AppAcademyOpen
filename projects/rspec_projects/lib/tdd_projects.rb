
class Array
  
  def my_uniq
    new_arr = []

    self.each do |el|
      next if new_arr.include?(el)
      new_arr << el
    end
    new_arr
  end


  def two_sum
    sums = []

    self.each_with_index do |num1, i1|
      self.each_with_index do |num2, i2|
        sums << [i1, i2] if num1 + num2 == 0 if i1 < i2
      end
    end

    sums
  end

  def my_transpose
    length = self[0].length
    transposed = Array.new(length) {Array.new(length)}

    (0...length).each do |i1|
      (0...length).each do |i2|
        transposed[i1][i2] = self[i2][i1]
      end
    end
    transposed
  end


end