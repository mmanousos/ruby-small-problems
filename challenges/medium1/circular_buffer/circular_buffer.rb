class CircularBuffer
  def initialize(limit)
    @limit = limit
    @buffer = []
  end

  def write(value)
    update_buffer(value) { raise(BufferFullException) }
  end

  def write!(value)
    update_buffer(value) { buffer.shift }
  end

  def clear
    buffer.clear
  end

  def read
    buffer.shift || raise(BufferEmptyException)
  end

  private

  attr_reader :limit
  attr_accessor :buffer

  def update_buffer(element)
    return if element.nil?
    yield if buffer.size == limit
    buffer << element
  end

  class BufferFullException < Exception
    def initialize(msg = 'Buffer is full. No more elements may be stored.')
      super
    end
  end

  class BufferEmptyException < Exception
    def initialize(msg = 'Buffer is empty. Nothing to read.')
      super
    end
  end
end
