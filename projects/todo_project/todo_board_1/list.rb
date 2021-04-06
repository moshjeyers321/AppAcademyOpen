require_relative "item.rb"

class List

    attr_accessor :label

    def initialize(label)
        @items = []
        @label = label
    end

    def add_item(title, deadline, description='')

        # items << Item.new(title,deadline,description) if Item.valid_date?(deadline)
        if Item.valid_date?(deadline)
            @items << Item.new(title,deadline,description)
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        index >= 0 && index < @items.length
    end

    def swap(i1, i2)
        if valid_index?(i1) && valid_index?(i2)
            @items[i1], @items[i2] = @items[i2], @items[i1]
            return true
        else
            return false
        end
    end

    def [](index)
        if valid_index?(index)
            @items[index]
        else
            return nil
        end
    end

    def priority
        @items[0]
    end
    
    $line = '------------------------------------------'
    $sep = '| '

    def print
        puts $line
        puts "#{@label}".center($line.length)
        puts $line
        puts "Index | Item                 | Deadline"
        puts $line
        @items.each.with_index do |item, i|
            puts "#{i}".ljust(6) + $sep + "#{item.title}".ljust(21) + $sep + "#{item.deadline}"
        end
        puts $line
    end

    def print_full_item(index)
        if valid_index?(index)
            puts $line
            puts "#{self[index].title}".ljust($line.length - (self[index].deadline.length)) + "#{self[index].deadline}"
            if self[index].description.length == 0
                puts "No Description"
            else
                puts "#{self[index].description}"
            end
            puts $line
        end
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        if valid_index?(index)
            while amount > 0 && index > 0
                self.swap(index, index - 1)
                amount -= 1
                index -=1
            end
            return true
        else
            return false
        end
    end

    def down(index, amount=1)
        if valid_index?(index)
            while (amount > 0) && (index < (self.size-1))
                self.swap(index, index + 1)
                amount -= 1
                index += 1
            end
            return true
        else
            return false
        end
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end
end