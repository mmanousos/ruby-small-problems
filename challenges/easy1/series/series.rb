class Series
  def initialize(string)
    @string = string
  end

  # doesn't account for leading 0s in the original string

  # def slices(integer)
  #   raise ArgumentError if integer > @string.length
  #
  #   results = []
  #   digits = @string.to_i.digits.reverse
  #   digits.each_cons(integer) { |number| results << number }
  #   results
  # end

  def slices(integer)
    raise ArgumentError, "There aren't that many digits" if integer > @string.length

    @string.chars.map(&:to_i).each_cons(integer).with_object([]) do |num, arr|
      arr << num
    end
  end
end
