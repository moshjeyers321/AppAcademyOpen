require 'byebug'

class Maze

    DIRS = [[1, 0], [0, 1], [-1, 0], [0, -1]]

        attr_reader :start_ind, :end_ind
    def initialize(file_name)
        @maze = read_maze(file_name)
        @start_ind = find_start
        @end_ind = find_end
    end

    def read_maze(file_name)
        maze = []
        File.foreach(file_name) {|line| maze << line.chomp.split("") }
        maze
    end

    def print_maze
        @maze.each do |row|
            puts row.join("")
        end
    end

    def inbounds?(coords)
        row, col = coords

        positive = (row >= 0) && (col >= 0)
        inbounds = (row < @maze.length) && (col < @maze[0].length)
        positive && inbounds
    end

    def find_start
        find_char("S")
    end
    
    def find_end
        find_char("E")
    end

    def is_wall?(coords)
        row, col = coords
        @maze[row][col] == "*"
    end

    def find_char(char)
        @maze.each_with_index do |line, row|
            return [row, line.index(char)] if line.index(char)
        end
    end

    def find_neighbors(coords)
        row, col = coords
        neighbors = []
        # debugger
        DIRS.each do |n_row, n_col|
            neighbor = [(row + n_row), (col + n_col)]
            if inbounds?(neighbor) && !(is_wall?(neighbor))
                neighbors << neighbor 
            end
        end

        neighbors
    end


    def find_distance(point)
        p_x, p_y = point
        final_x, final_y = end_ind
        (p_x - final_x).abs + (p_y - final_y).abs
    end

    def mark(point)
        x, y = point
        @maze[x][y] = "X"
    end

    def mark_path(path)
        path.each do |point|
            mark(point)
        end
    end

    #starting at a point... move in a direction if the distance from the new point is shorter than where we started
        #keep moving in the direction if possible
        #if we hit a wall, check new directions ^^

    def solve_that_shit
        current_point = @start_ind
        current_distance = find_distance(current_point)
        traveled_path = []

        while current_distance > 0
            neighbors = find_neighbors(current_point)
            # debugger
            neighbors.each do |neighbor|
                moved = false
                if ((find_distance(neighbor) < current_distance) && !(traveled_path.include?(neighbor))) || !(traveled_path.include?(neighbor))
                    traveled_path << current_point
                    current_point = neighbor
                    moved = true
                end
                
                current_distance = find_distance(current_point)
                break if moved == true
            end
            p traveled_path
        end
        mark_path(traveled_path)
        self.print_maze
    end



    # end #end Solver class

end

if __FILE__ == $PROGRAM_NAME
    filename = ARGV[0] || "new_maze.txt"
    test_maze = Maze.new(filename)
    puts test_maze
    puts "Start is at #{test_maze.start_ind}"
    puts "End is at #{test_maze.end_ind}"
    test_maze.solve_that_shit
end