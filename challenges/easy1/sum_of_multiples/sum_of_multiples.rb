class SumOfMultiples
  def self.invalid?(number)
    raise ArgumentError if number =~ /\D/ || !number.integer? || number < 1
  end

  def self.to(number, factors = [3, 5])
    self.invalid?(number)
    values = [*1...number]
    factors.each_with_object([]) do |factor, results|
      results << values.select { |value| value % factor == 0 }
    end.flatten.uniq.sum
  end

  def initialize(*factors)
    @factors = factors
  end

  def to(number)
    self.class.to(number, @factors)
  end
end
