class Palindromes
  def initialize(args)
    max = args[:max_factor]
    min = args[:min_factor] || 1
    @range = [*min..max]
    @palindromes = {}
  end

  def generate
    all = range.product(range)
    all.each do |factors|
      product = factors.reduce(&:*)
      next unless palindrome?(product)
      add_palindrome_to_hash(product, factors.sort)
    end
  end

  def largest
    max_product = palindromes.keys.max
    Palindrome.new(max_product, palindromes[max_product])
  end

  def smallest
    min_product = palindromes.keys.min
    Palindrome.new(min_product, palindromes[min_product])
  end

  private

  attr_reader :range
  attr_accessor :palindromes

  def palindrome?(value)
    value.to_s == value.to_s.reverse
  end

  def add_palindrome_to_hash(product, factors)
    palindromes[product] ||= [factors]
    palindromes[product] << factors unless palindromes[product].include?(factors)
  end
end

class Palindrome
  attr_reader :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end
