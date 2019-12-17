class Bst
  attr_reader :data
  attr_accessor :left, :right

  def initialize(number)
    @data = number
  end

  def insert(number)
    if number <= @data
      @left&.insert(number) || @left = Bst.new(number)
    else
      @right&.insert(number) || @right = Bst.new(number)
    end
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    @left&.each(&block)
    yield(data)
    @right&.each(&block)
  end
end
