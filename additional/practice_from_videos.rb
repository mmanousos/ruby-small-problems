Reversed
Write a method that takes a string and returns a new string that is that string reversed.
Do not use the built in String#reverse method.

Fizzbuzz
Write a method that takes two arguments, the starting number and the ending number.
Print out all the numbers from the starting number to the ending number. If the
number is divisible by 3, replace it with "Fizz"; divisible by 5, "Buzz"; divisible
by both 3 and 5, "FizzBuzz".

Query Search
Given an array of products that include name and price, write a method that uses
a hash as an argument to perform a search of the product array to return a
new array of items matching the criteria.

PRODUCTS = [
  { name: "Thinkpad x210", price: 220 },
  { name: "Thinkpad x220", price: 250 },
  { name: "Thinkpad x250", price: 979 },
  { name: "Thinkpad x230", price: 300 },
  { name: "Thinkpad x230", price: 330 },
  { name: "Thinkpad x230", price: 350 },
  { name: "Thinkpad x240", price: 700 },
  { name: "Macbook Leopard", price: 300 },
  { name: "Macbook Air", price: 700 },
  { name: "Macbook Pro", price: 600 },
  { name: "Macbook", price: 1449 },
  { name: "Dell Latitude", price: 200 },
  { name: "Dell Latitude", price: 650 },
  { name: "Dell Inspiron", price: 300 },
  { name: "Dell Inspiron", price: 450 }
]

query = {
  price_min: 240,
  price_max: 280,
  q: 'thinkpad'
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

def search(query)
  PRODUCTS.select do |item|
    item[:name].downcase.include?(query[:q]) &&
    item[:price] <= query[:price_max] &&
    item[:price] >= query[:price_min]
  end
end

search(query) == [ { name: "Thinkpad x220", price: 250 } ]
search(query2) == [ { name: "Dell Inspiron", price: 300 },
                   { name: "Dell Inspiron", price: 450 } ]


Vowels
Write a method that takes an array of strings and returns an array of the same
string values, except with the vowels removed.

input: ["green", "yellow", "black", "white"]
output: ["grn", "yllw", "blck", "whte"]

def vowels(arr)
  arr.each { |string| string.tr!('aeiou', '') }
end

or (better)

def vowels(arr)
  arr.map { |string| string.tr('aeiou', '') }
end


Parentheses
Write a method that takes a string and returns a boolean indicating whether the
string has a balanced set of parentheses.
balancer("hi") == true
balancer("(hi") == false
balancer("(hi)") == true
balancer(")hi(") == false # extra credit


def balancer(str)
#   if str.start_with?(')') || str.end_with?('(')
#     false
#   elsif str.include?(')(')
#     false
#   elsif str.include?('(') && str.include?(')')
#     true
#   elsif !str.include?('(') && !str.include?(')')
#     true
#   else
#     false
#   end
# end

def balancer(str)
 return false unless str.count('(') == str.count(')')

  paren_count = 0
  str.each_char do |char|
    paren_count += 1 if char == '('
    paren_count -= 1 if char == ')'
    return false if paren_count < 0
  end

  true
end

p balancer("hi") # == true
p balancer("(hi") # == false
p balancer("(hi)") # == true
p balancer(")hi(") # == false # extra credit
p balancer("hi(") # == false # extra credit
p balancer("(hi)(bye)") # == true
p balancer("(((())))(()") # == false

Primes
=begin
Write a method that takes two numbers. It shoud print out all primes between the
two numbers. Do not use Ruby's `#prime` class.
=end
# primes = divisible only by themselves and 1

# sloppy
def find_primes(num1, num2)
  primes = []
  range = [*num1..num2]

  # if range include 2 or 3, push them into primes and delete them from range
  range.each do |num|
    if num == 2 || num == 3
      primes << num
      range.delete(num)
    end
  end

  # remove all the even numbers from the range
  odds_range = range.select { |num| num.odd? } 

  primes_first = odds_range.reject do |num|
    Math::sqrt(num) % 1.0 == 0
    # square root is not an integer (so it is not a perfect square => either prime or divisible by many other numbers)
  end

  primes_second = primes_first.reject do |num|
    num % 3 == 0
  end

  p primes.concat(primes_second)
end

# refined
def is_prime?(number)
  (2...number).each do |divisor|
    return false if number % divisor == 0
  end

  true
end

def find_primes(start, stop)
  (start..stop).select { |num| is_prime?(num) }
end

find_primes(3, 10) # => 3, 5, 7
find_primes(7, 14) # => 7, 11, 13
find_primes(21, 27) # => 23
