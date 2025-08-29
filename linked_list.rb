require_relative 'node'

class LinkedList
  include Enumerable
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(key, value)
    if @head.nil? 
      @head = Node.new(key, value)
      return
    end

    current = @head
    while current
      if current.key == key
        current.value = value
        return
      end

      if current.next_node.nil?
        current.next_node = Node.new(key, value)
        return
      end
      current = current.next_node
    end
  end

  def find(key)
    return nil if @head.nil?
    current = @head
    while current 
      return current.value if current.key == key
      current = current.next_node
    end
    nil
  end

  def contains?(key)
    !find(key).nil?
  end

  def remove(key)
    return nil if @head.nil?
    if @head.key == key
      match = @head.value
      @head = @head.next_node
      return match
    end
    current = @head
    while current && current.next_node
      if current.next_node.key == key
        match = current.next_node.value
        current.next_node = current.next_node.next_node
        return match
      end
      current = current.next_node
    end
    nil
  end

  def each
    current = @head
    while current
      yield(current)
      current = current.next_node
    end
  end

  def keys
    map { |node| node.key }
  end

  def values
    map { |node| node.value}
  end

  def entries
    map { |node| [node.key, node.value]}
  end
end