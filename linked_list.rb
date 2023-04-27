class LinkedList
    def initialize
      @head = nil
      @tail = nil
      @size = 0
    end
  
    def append(value)
      node = Node.new(value)
  
      if @head.nil?
        @head = node
        @tail = node
      else
        @tail.next_node = node
        @tail = node
      end
  
      @size += 1
    end
  
    def prepend(value)
      node = Node.new(value)
  
      if @head.nil?
        @head = node
        @tail = node
      else
        node.next_node = @head
        @head = node
      end
  
      @size += 1
    end
  
    def size
      @size
    end
  
    def head
      @head
    end
  
    def tail
      @tail
    end
  
    def at(index)
      return nil if index < 0 || index >= @size
  
      current = @head
      index.times do
        current = current.next_node
      end
  
      current
    end
  
    def pop
      return nil if @size == 0
  
      if @size == 1
        node = @head
        @head = nil
        @tail = nil
        @size = 0
        return node
      end
  
      current = @head
      (size - 2).times do
        current = current.next_node
      end
  
      node = @tail
      @tail = current
      @tail.next_node = nil
      @size -= 1
  
      node
    end
  
    def contains?(value)
      current = @head
  
      while !current.nil?
        return true if current.value == value
        current = current.next_node
      end
  
      false
    end
  
    def find(value)
      current = @head
      index = 0
  
      while !current.nil?
        return index if current.value == value
        current = current.next_node
        index += 1
      end
  
      nil
    end
  
    def to_s
      current = @head
      str = ""
  
      while !current.nil?
        str += "( #{current.value} ) -> "
        current = current.next_node
      end
  
      str += "nil"
    end
  
    def insert_at(value, index)
      return if index < 0 || index > @size
  
      if index == 0
        prepend(value)
      elsif index == @size
        append(value)
      else
        node = Node.new(value)
        prev_node = at(index - 1)
        next_node = prev_node.next_node
        prev_node.next_node = node
        node.next_node = next_node
        @size += 1
      end
    end
  
    def remove_at(index)
      return nil if index < 0 || index >= @size
  
      if index == 0
        node = @head
        @head = node.next_node
        @size -= 1
        return node
      end
  
      prev_node = at(index - 1)
      node = prev_node.next_node
      prev_node.next_node = node.next_node
  
      if index == @size - 1
        @tail = prev_node
      end
  
      @size -= 1
  
      node
    end
  end
  
  class Node
    attr_accessor :value, :next_node
  
    def initialize(value)
      @value = value
      @next_node = nil
    end
  end
  