
class Board
    attr_reader :grid

    def initialize()
        @grid = Array.new(3) { |index| Array.new(3, "_")}
        # @grid = Matrix.build(3) {'_'}
    end

    def valid?(pos) #should accept an array "pos"[x,y] and check if it is a valid position on the board
        # return (pos[0] < @grid.length && pos[1] < @grid.length)
        pos.all? do |val|
            val >= 0 && val < @grid.length
        end
    end

    def empty?(pos)
        if valid?(pos)
            return true if @grid[pos[0]][pos[1]] == '_'
            return false
        end
    end

    def place_mark(pos, mark)
        if valid?(pos) && empty?(pos)
            @grid[pos[0]][pos[1]] = mark
        elsif !valid?(pos)
            raise "#{pos} is not a valid position"
        else
            raise "#{pos} is already taken"
        end
    end

    def print
        @grid.each do |row|
            p row
        end
        puts "\n"
    end

    def win_row?(mark)
        @grid.any? do |row|
            row.all? { |el| el==mark}
        end
    end

    def win_col?(mark)
        @grid.transpose.any? do |col|
            col.all? { |el| el == mark}
        end
    end

    def win_diagonal?(mark)
        diagrange = (0...@grid.length).to_a.reverse
        ddiag = []
        udiag = []

        diagrange.each_with_index do |i1, i2| #i1 = (2..0) i2 = (0..2)
            ddiag << @grid[i2][i2]
            udiag << @grid[i2][i1]
        end
        return true if ddiag.all? { |el| el == mark} || udiag.all? { |el| el == mark} #returns true if either diagonal is full of mark
        false
    end

    def win?(mark)
        return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
        false
    end

    def empty_positions?
        @grid.any? do |row|
            row.include?('_')
        end
    end

end

# pos = [0,0]
# p board.empty?(pos) #true

# pos = [1,1]
# p board.empty?(pos) #true

# pos = [3,3]
# p board.empty?(pos) #not a valid position
