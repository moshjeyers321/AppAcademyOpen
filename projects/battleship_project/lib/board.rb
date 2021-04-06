class Board
    
    attr_reader :size
    
    def self.print_grid(grid)       #let's us easily print a grid
        grid.each do |row|
            # row_str = row.join(" ")
            puts row.join(" ")
        end
    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts "you sunk my battleship!\n"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        # tbp = @size/4

        # while tbp > 0
        #     rand_position = [rand(0...Integer.sqrt(@size)),rand(0...Integer.sqrt(@size))]  #rand(0...Integer.sqrt(@size))
        #     if self[rand_position] != :S
        #         self[rand_position] = :S
        #         tbp -= 1
        #     end
        # end
        max_ships = 0.25 * self.size

        while self.num_ships < max_ships
          row = rand(0...@grid.length)
          col = rand(0...@grid.length)
          pos = [row, col]
          self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |col|
                if col == :S
                    :N
                else
                    col
                end
            end
        end
    end


    def cheat       #prints the cheat grid
        Board.print_grid(@grid)
    end

    def print       #prints the standard game board
        Board.print_grid(self.hidden_ships_grid)
    end

end
