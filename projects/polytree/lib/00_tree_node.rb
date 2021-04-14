class PolyTreeNode

  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end


  def parent=(parent)
    return if self.parent == parent

    if self.parent 
      self.parent.children.delete(self)
    end

    @parent = parent

    self.parent.children << self unless self.parent.nil?

    self
  end

  def add_child(child_node)
    child_node.parent= self
  end

  def remove_child(child_node)
    if child_node && !self.children.include?(child_node)
      raise "node isn't a child"
    end

    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      node = queue.shift

      return node if node.value == target_value
      queue.concat(node.children)
    end

    nil
  end

end