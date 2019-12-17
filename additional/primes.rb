=begin
Prime True / False
Determine whether an integer is a prime. Do not use the prime class.

input: integer
output: boolean indicating if the argument integer is prime or not.

Primes: only divisible by themselves and 1
assume the number is greater than 1.

AL:
range of 2...integer (non inclusive)
break condition if the integer is evenly divided by a number in the range with no remainder
int % range_num == 0
=end

def prime?(num)
  return false if num == 1
  (2...num).each {|n| return false if num % n == 0 }

  true
end

p prime?(3) == true
p prime?(4) == false
p prime?(5) == true
p prime?(10) == false
p prime?(21) == false
p prime?(7) == true
p prime?(24) == false
p prime?(11) == true
