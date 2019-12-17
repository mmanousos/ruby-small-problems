class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(*value)
    @datum = value[0]
    @next = value[1]
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def size
    count = 0
    element = @head
    while element
      count += 1
      element = element.next
    end
    count
  end

  def empty?
    @head.nil?
  end

  def push(value)
    new_element = Element.new(value, head)
    self.head = new_element
  end

  def peek
    head&.datum
  end

  def pop
    result = self.peek
    new_head = @head.next
    @head = new_head
    result
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    return list if array.nil?
    array.reverse.each_with_object(list) { |value, list| list.push(value) }
  end

  def to_a
    result = []
    element = head
    result << pop while !self.empty?
    result
  end

  def reverse
    reversed_list = SimpleLinkedList.new
    reversed_list.push(pop) while (!empty?)
    reversed_list
  end
end
