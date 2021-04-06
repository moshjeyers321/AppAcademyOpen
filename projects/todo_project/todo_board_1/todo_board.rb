require_relative 'list.rb'
require_relative 'item.rb'

class TodoBoard

    attr_reader :list
    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "\nEnter a command: "
        command, *args = gets.chomp.split(' ')

        case command
        when 'mktodo'
            @list.add_item(*args)
        when 'up'
            @list.up(*args.map(&:to_i))
        when 'down'
            @list.down(*args.map(&:to_i))
        when 'swap'
            @list.swap(*args.map(&:to_i))
        when 'sort'
            @list.sort_by_date!
        when 'priority'
            @list.print_priority
        when 'print'
            if args.length > 0
                @list.print_full_item(args[0].to_i)
            else
                @list.print
            end
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        while true
            return if !get_command
        end
    end
end