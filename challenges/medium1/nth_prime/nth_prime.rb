class Prime
  def self.nth(number)
    raise ArgumentError if number < 1
    counter = 0

    (2..).each do |value|
      counter += 1 if self.prime?(value)
      return value if counter == number
    end
  end

  def self.prime?(value)
    is_prime = nil
    square_root = Math.sqrt(value)
    if square_root < 2
      is_prime = true
    else
      (2..square_root).each do |divisor|
        remainder = value % divisor
        remainder == 0 ? is_prime = false : next
      end
    end
    is_prime.nil? ? true : is_prime
  end
end
