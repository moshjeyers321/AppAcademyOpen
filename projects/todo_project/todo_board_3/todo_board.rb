require_relative 'list.rb'
require_relative 'item.rb'

class TodoBoard

    attr_reader :lists

    def initialize
        # @list = List.new(label)
        @lists = {}
    end

    def get_command
        print "\nEnter a command: "
        command, list, *args = gets.chomp.split(' ')
        # list = args[0]

        case command
        when 'mklist'
            @lists[list] = List.new(list)
        when 'ls'
            @lists.each_key {|k| puts ' ' + k}
        when 'showall'
            @lists.each_value(&:print)
        when 'mktodo'
            @lists[list].add_item(*args)
        when 'up'
            @lists[list].up(*args.map(&:to_i))
        when 'down'
            @lists[list].down(*args.map(&:to_i))
        when 'swap'
            @lists[list].swap(*args.map(&:to_i))
        when 'sort'
            @lists[list].sort_by_date!
        when 'priority'
            @lists[list].print_priority
        when 'print'
            if args.empty?
                @lists[list].print
            else
                @lists[list].print_full_item(args[0].to_i)
            end
        when 'toggle'
            i = args[0].to_i
            @lists[list].toggle_item(i)
        when 'rm'
            i = args[0].to_i
            @lists[list].remove_item(i)
        when 'purge'
            @lists[list].purge
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

TodoBoard.new.run