=begin
*assignment*
What's my Bonus?
Write a method that takes two arguments, a positive integer and a boolean, and
calculates the bonus for a given salary. If the boolean is true, the bonus
should be half of the salary. If the boolean is false, the bonus should be 0.

Examples:
  puts calculate_bonus(2800, true) == 1400
  puts calculate_bonus(1000, false) == 0
  puts calculate_bonus(50000, true) == 25000
The tests above should print true.

*problem*
input: positive integer and boolean, in that order
assume no other values will be provided.
output: integer, either half of the provided salary, or 0
check if 2nd argument is true/false
if true, return 1st argument divided / 2

*examples / test cases *
see above

*data structures*
input: integer + boolean
output: integer (either 0 or # that is 1/2 of original integer)

*algorithm*
START
declare method(integer, boolean)
  if boolean
    integer / 2
  else
    0
  end
end
END

=end

=begin
def calculate_bonus(salary, bonus)
  if bonus
    salary / 2
  else
    0
  end
end
=end

#shorter but not good format (warning: "else without rescue is useless")
=begin
def calculate_bonus(salary, bonus)
  return salary / 2 if bonus
  else 0
end
=end

#shortest - perfect use case for ternary operator
def calculate_bonus(salary, bonus)
  if bonus ? (salary / 2) : 0
end


puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
