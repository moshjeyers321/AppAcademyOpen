class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next, self.prev = nil, nil
    self
  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    self.head.next
  end

  def last
    self.tail.prev
  end

  def empty?
    self.head.next == self.tail
  end

  def get(key)
    each do |node|
      return node.val if node.key == key
    end
  end

  def include?(key)
    each do |node|
      return true if node.key == key
    end

    false
  end

  def append(key, val)
    node = Node.new(key, val)
    
    self.tail.prev.next = node
    node.prev = self.tail.prev
    node.next = self.tail
    self.tail.prev = node

    node
  end

  def update(key, val)
    each do |node|
      if node.key == key
        node.val = val
        return node
      end
    end
  end

  def remove(key)
    each do |node|
      if node.key == key
        node.remove
        return node.val
      end
    end

    nil
  end

  def each
    current = self.head.next
    until current == self.tail
      yield current
      current = current.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
