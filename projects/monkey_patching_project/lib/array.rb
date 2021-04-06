# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length < 1

        largest = self[0]
        smallest = self[0]

        self.each do |num|
            largest = num if num > largest
            smallest = num if num < smallest
        end
        
        largest-smallest
    end

    def average
        return nil if self.length < 1

        return self.sum/(self.length * 1.00)

    end

    def median
        return nil if self.length < 1

        if self.length.odd?
            return self.sort[(self.length/2)]
        else            #i and i-1
            sorted = self.sort
            return (sorted[sorted.length/2] + sorted[sorted.length/2-1]) / 2.0
        end
    end

    def counts
        hash = Hash.new(0)

        self.each do |el|
            hash[el] += 1
        end

        hash
    end

    def my_count(value)
        count = 0

        self.each do |el|
            count += 1 if value == el
        end

        count
    end

    def my_index(value)

        self.each_with_index do |el, i|
            return i if el == value
        end

        nil
    end

    def my_uniq
        unique = []

        self.each do |el|
            unique << el if !unique.include?(el)
        end

        unique
    end

    def my_transpose
        new_arr = []

        (0...self.length).each do |row|
            new_row = []
            (0...self.length).each do |col|
                new_row << self[col][row]
            end

            new_arr << new_row
        end

        new_arr

    end


end
