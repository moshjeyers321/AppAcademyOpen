class Stack
  
  def initialize
    @array = []
  end

  def push(el)
    array.push(el)
  end

  def pop
    array.pop
  end

  def peek
    array.last
  end

  private

  attr_reader :array

end

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    queue.push(el)
  end

  def dequeue
    queue.shift
  end

  def peek
    queue.first
  end

  private

  attr_reader :queue
end

class MyMap


  def initialize
    @map = []
  end

  def exist?(key)
    map.any? { |pair| key == pair[0] }
  end

  def set(key, value)
    if exist?(key)
      return "key already exists"
    end

    map.push([key, value])
  end

  def update(key, value)
    if exist?(key)
      index = map.index { |pair| pair[0] == key }
      map[index][1] = value
    end
    map[index]
  end

  def get(key)
    map.each { |pair| return pair[1] if pair[0] == key }
  end

  def delete(key)
    value = get(key)
    map.reject! { |pair| pair[0] == key}
    value
  end

  def show
    deep_dup(map)
  end

  private

  attr_reader :map

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end