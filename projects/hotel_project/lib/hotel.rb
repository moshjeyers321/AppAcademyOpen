require_relative "room"
require "byebug"

class Hotel

    def initialize(hotel_name, rooms)
        @name = hotel_name
        @rooms = {}

        rooms.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end
  
    def name
        cap_name = @name.split(" ")
        cap_name.map! { |word| word.capitalize}
        cap_name.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        return @rooms.include?(room_name) # true if exists, false otherwise
    end

    def check_in(person, room_name)
        if !room_exists?(room_name)
            puts "sorry, room does not exist"
        else

            if @rooms[room_name].add_occupant(person) == false
                puts 'sorry, room is full'
            else
                puts 'check in successful'
            end

        end
    end

    def has_vacancy?
        @rooms.values.any? { |room| room.available_space > 0}
    end

    def list_rooms
        @rooms.each do |name, room|
            puts "#{name} : #{room.available_space}"
        end
    end


end
