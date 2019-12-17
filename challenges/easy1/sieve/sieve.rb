class Sieve
  LOWEST_PRIME = 2

  def initialize(number)
    raise ArgumentError, 'Number must be 2 or greater.' if number < LOWEST_PRIME
    raise ArgumentError, 'Number must be an integer.' if !number.integer?
    @number = number
  end

  def primes
    primes = [*LOWEST_PRIME..@number]
    multipliers = primes.clone
    multipliers.each do |number|
      @number.times do |count|
        product = number * primes[count]
        break if product > @number
        primes.delete(product)
      end
    end
    primes
  end
end
