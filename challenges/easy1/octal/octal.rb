class Octal
  INVALID = /\D|[8-9]/

  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 if @number.chars.any? { |char| char =~ INVALID }
    @number.to_i.digits.map.with_index { |val, idx| val * (8**idx) }.sum
  end
end
