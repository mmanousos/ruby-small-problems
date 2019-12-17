class Luhn
  def self.create(number)
    0.upto(9) do |digit|
      new_number = number * 10 + digit
      return new_number if Luhn.new(new_number).valid?
    end
  end

  def initialize(value)
    @value = value
  end

  def addends
    @value
      .digits
      .map.with_index { |digit, idx| idx.odd? ? digit * 2 : digit }
      .map { |number| number > 9 ? number - 9 : number }
      .reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    (checksum % 10).zero?
  end
end
