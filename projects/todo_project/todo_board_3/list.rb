require_relative "item.rb"

class List

    LINE_WIDTH = 49
    INDEX_COL_WIDTH = 5
    ITEM_COL_WIDTH = 20
    DEADLINE_COL_WIDTH = 10
    DONE_COL_WIDTH = 5
    SPACER = "| "

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
    
    # $line = '------------------------------------------'
    # $sep = '| '

    def print
        status = ""
        puts "-" * LINE_WIDTH
        puts "#{@label.upcase}".center(LINE_WIDTH)
        # puts $line
        puts "-" * LINE_WIDTH
        # puts "Index | Item                 | Deadline"
        puts "#{'Index'.ljust(INDEX_COL_WIDTH)} | #{'Item'.ljust(ITEM_COL_WIDTH)} | #{'Deadline'.ljust(DEADLINE_COL_WIDTH)} | Done"
        # puts $line
        puts "-" * LINE_WIDTH
        @items.each.with_index do |item, i|
            # puts "#{i}".ljust(6) + $sep + "#{item.title}".ljust(21) + $sep + "#{item.deadline}"
            item.done ? status = "[✓]" : status = "[ ]"
            puts "#{i.to_s.ljust(INDEX_COL_WIDTH)} | #{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEADLINE_COL_WIDTH)} | #{status}"
        end
        # puts $line
        puts "-" * LINE_WIDTH
    end

    def print_full_item(index)
        item = self[index]
        if valid_index?(index)
            puts "-" * LINE_WIDTH
            puts "#{item.title.ljust(LINE_WIDTH/2)}#{item.deadline.rjust(LINE_WIDTH/2)}"
            if item.description.length == 0
                puts "#{"No Description".ljust(LINE_WIDTH/2)}#{item.done ? "[✓]".rjust(LINE_WIDTH/2): "[ ]".rjust(LINE_WIDTH/2)}"
            else
                puts "#{item.description.ljust(LINE_WIDTH/2)}#{item.done ? "[✓]".rjust(LINE_WIDTH/2): "[ ]".rjust(LINE_WIDTH/2)}"
            end
            puts "-" * LINE_WIDTH
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

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        return false if !valid_index?(index)
        @items.delete_at(index)
        true
    end

    def purge
        tbdel = []
        @items.each.with_index do |item, i|
            tbdel << i if item.done
        end
        tbdel.reverse_each do |i|
            @items.delete_at(i)
        end
    end
end