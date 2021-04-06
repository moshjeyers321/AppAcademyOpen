class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i+=1
        end
        self
    end

    def my_select(&prc)
        new_array = []
        self.my_each do |num|
            new_array << num if prc.call(num)
        end
        new_array
    end

    def my_reject(&prc)
        new_array = []
        self.my_each do |num|
            new_array << num if !prc.call(num)
        end
        new_array
    end

    def my_any?(&prc)
        return true if self.my_select(&prc).length > 0
        false
    end
    
    def my_all?(&prc)
        return true if self.my_reject(&prc).length == 0
        false
    end

    def my_flatten
        flattened = []

        self.my_each do |el|
            if el.is_a?(Array) 
                flattened += (el.my_flatten)
            else
                flattened << el
            end
        end
        flattened
    end

    def my_zip(*arrays)
        # zipped = Array.new(self.length) { |i| Array.new(arrays.length+1, nil)}
        zipped = []

        self.length.times do |i|
            smallzip = [self[i]]

            arrays.my_each do |array|
                smallzip << array[i]
            end
            zipped << smallzip
        end

        zipped
    end

    def my_rotate(rotations = 1)
        split_i = rotations % self.length

        self.drop(split_i) + self.take(split_i)
    end

    def my_join(separator = "")
        joined = ""

        self.length.times do |i|
            joined += self[i]

            joined += separator unless i== self.length-1
        end
        joined
    end

    def my_reverse
        reversed = []
        self.my_each do |el|
            reversed.unshift(el)
        end
        reversed
    end








end

