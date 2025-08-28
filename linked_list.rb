require_relative 'node'

class LinkedList
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
      if current.key == key
        return current.value
      end
      current = current.next_node
    end
    nil
  end
end