=begin
*Assignment*
Odd
Write a method that takes one integer argument, which may be positive, negative, or zero.
This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

Examples:
	puts is_odd?(2)    # => false
	puts is_odd?(5)    # => true
	puts is_odd?(-17)  # => true
	puts is_odd?(-8)   # => false
	puts is_odd?(0)    # => false
	puts is_odd?(7)    # => true

Keep in mind that you're not allowed to use #odd? or #even? in your solution.

*Problem*
	input: single integer, positive, negative or zero (only valid integers provided)
	output: boolean (true) only if absolute value is odd
		should it return false if the value is even? (assume yes based on examples)

*Examples / Test Cases*
see above

*Data Structure*
keep as numerical values

*Algorithm*
create a method that checks the remainder of the provided integer divided by 2.
if the remainder is 1, returns true
check if negative numbers % 2 return odd / even correctly (believe they do)
=end


def is_odd?(num)
	if num % 2 == 1
		return true
	else
		return false
	end
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

=begin *Course Solution*
def is_odd?(num)
	num % 2 == 1
end

much simpler - conditionals always return true/false, don't need to specify output.
=end

=begin *Further Exploration*
This solution relies on the fact that % is the modulus operator in Ruby, not a remainder operator as in some other languages.
Remainder operators return negative results if the number on the left is negative, while modulus always returns a non-negative result if the number on the right is positive.

	modulus						remainder
5 mod 2 == 1			5 rem 2 == 1
-5 mod 2 == 1			-5 rem 2 == -1
5 mod -2 == -1		5 rem -2 == 1
-5 mod -2 == -1		-5 rem -2 == -1

If you weren't certain whether % were the modulus or remainder operator, how would you rewrite #is_odd? so it worked regardless?

The Integer#remainder method performs a remainder operation in Ruby. Rewrite #is_odd? to use Integer#remainder instead of %.
Note: before version 2.4, Ruby used the Numeric#remainder method instead.

*potetial solutions*
1) can provide both positive or negative values for the output of num % 2
2) can check if num is negative and then % -2 => this would not evaluate to 1, but to -1 according to the provided chart.
3) can check if num is negative and convert it to positive by multiplying by -1 and then evaluating using %.

#1)
def is_odd?(num)
	if (num % 2 == 1) || (num % 2 == -1)
		return true
	else
		return false
	end
end

#3)
def is_odd?(num)
	if num < 0
		num * -1
	end
	num % 2 == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
=end
