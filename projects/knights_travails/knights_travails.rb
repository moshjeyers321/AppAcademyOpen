require_relative 'polytree'

class KnightPathFinder
  attr_reader :start_pos

  DELTAS = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]

  def self.valid_moves(pos)
    x, y = pos
    valids = []
    DELTAS.each do |d_pos|
      d_x, d_y = d_pos
      valids << [x + d_x, y + d_y] if (x + d_x).between?(0,7) && (y + d_y).between?(0,7)
    end
    valids
  end

  
  def initialize(start_pos)
    @start_pos = start_pos
    @considered_positions = [start_pos]
    build_move_tree
  end


  def find_path(end_pos)
    end_node = root_node.dfs(end_pos)

    trace_path_back(end_node)
      .reverse
      .map(&:value)
  end

  def trace_path_back(end_node)
    nodes = []

    current_node = end_node
    until current_node.nil?
      nodes << current_node
      current_node = current_node.parent
    end

    nodes
  end
  
  private_constant :DELTAS

  private

  attr_accessor :root_node, :considered_positions
  
  def build_move_tree
    self.root_node = PolyTreeNode.new(start_pos)
    
    nodes = [root_node]
    
    until nodes.empty?
      current_node = nodes.shift
      
      current_pos = current_node.value
      
      new_move_positions(current_pos).each do |next_pos|
        next_node = PolyTreeNode.new(next_pos)
        current_node.add_child(next_node)
        nodes << next_node
      end
    end 
  end
  
  def new_move_positions(pos)
    new_positions = KnightPathFinder.valid_moves(pos)
    new_positions.reject! { |position| @considered_positions.include?(position)}
    @considered_positions.concat(new_positions)
    new_positions
  end
  
end