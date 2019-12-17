class Triplet
  attr_reader :numbers

  def self.where(min_factor:1, max_factor:, sum:nil)
    triplets = create_triplet_objects(min_factor, max_factor)

    if sum
      triplets.select { |trio| trio.pythagorean?  && trio.sum == sum }
    else
      triplets.select { |trio| trio.pythagorean? }
    end
  end

  def self.create_triplet_objects(min, max)
    [*min..max].combination(3).to_a.map { |trio| self.new(trio) }
  end

  def initialize(val1, val2=nil, val3=nil)
    @numbers = val1.class == Array ? val1 : [val1, val2, val3]
  end

  def sum
    @numbers.sum
  end

  def product
    @numbers.reduce(&:*)
  end

  def pythagorean?
    (@numbers[0] ** 2) + (@numbers[1] ** 2) == @numbers[2] ** 2
  end
end
