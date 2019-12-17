class Trinary
  BASE = 3
  INVALID = /[^0-2]/

  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    return 0 if invalid_trinary?
    @trinary.to_i.digits.each_with_index.sum { |val, idx| val * BASE**idx }
  end

  private

  def invalid_trinary?
    @trinary.match(INVALID)
  end
end
