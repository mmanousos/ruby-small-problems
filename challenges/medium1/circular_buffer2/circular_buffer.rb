class CircularBuffer
  def write(value)
    full? ? (raise BufferFullException) : buffer << value unless value == nil
  end

  def write!(value)
    return if value == nil
    read if full?
    write(value)
  end

  def read
    buffer.empty? ? (raise BufferEmptyException) : buffer.shift
  end

  def clear
    buffer.clear
  end

  private

  BufferEmptyException = 'The buffer is empty.'
  BufferFullException = 'The buffer is full. Remove values before adding new.'

  attr_accessor :buffer

  def initialize(size)
    @buffer = []
    @size = size
  end

  def full?
    buffer.size == @size
  end
end
