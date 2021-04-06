class Item

    attr_accessor :title, :description
    attr_reader :deadline

    def self.valid_date?(date_string)
        date = date_string.split("-")

        date.map! {|el| el.to_i}

        (date[1] >=1 && date[1] <= 12) && (date[2] >= 1 && date[2] <= 31)
    end

    def initialize(title, deadline, description)
        @title = title
        @description = description

        raise "Invalid Deadline" if !Item.valid_date?(deadline)

        @deadline = deadline
    end

    def deadline=(date_string)
        Item.valid_date?(date_string) ? @deadline = date_string : (raise "Invalid Deadline")
    end
end