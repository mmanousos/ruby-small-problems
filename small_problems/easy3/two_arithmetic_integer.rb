=begin
*assignment*
Arithmetic Integer
Write a program that prompts the user for two positive integers, and then prints
the results of the following operations on those two numbers: addition,
subtraction, product, quotient, remainder, and power. Do not worry about
validating the input.

Example

==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
*problem*
input: two positive integers (assuming appropriate input, non zero)
output: display of all appropriate math functions (probably as strings)

*examples / test cases *
see above

*data structures*
integers (from strings)
interpolated strings

*algorithm*
START
  PUT '==> Enter the first number:'
  GET and SET first_num converted to integer
  PUT '==> Enter the second number:'
  GET and SET second_num converted to integer

  PRINT first_num + " + " + second_num + " = " + first_num + second_num
  PRINT first_num + " - " + second_num + " = " + first_num - second_num
  PRINT first_num + " * " + second_num + " = " + first_num * second_num
  PRINT first_num + " / " + second_num + " = " + first_num / second_num
  PRINT first_num + " % " + second_num + " = " + first_num % second_num
  PRINT first_num + " ** " + second_num + " = " + first_num ** second_num
END
=end
puts '==> Enter a positive integer:'
first_num = gets.chomp.to_i
puts '==> Enter a second positive integer:'
second_num = gets.chomp.to_i

puts "==> #{first_num} + #{second_num} = #{first_num + second_num}"
puts "==> #{first_num} - #{second_num} = #{first_num - second_num}"
puts "==> #{first_num} * #{second_num} = #{first_num * second_num}"
puts "==> #{first_num} / #{second_num} = #{first_num / second_num}"
puts "==> #{first_num} % #{second_num} = #{first_num % second_num}"
puts "==> #{first_num} ** #{second_num} = #{first_num ** second_num}"

#Further Exploration
=begin
What if we wanted to use floats instead of integers? How does this change this problem?


# simply requires converting received input to floats instead of integers
# (use #to_f).
puts '==> Enter a positive number:'
first_num = gets.chomp.to_f
puts '==> Enter a second positive number:'
second_num = gets.chomp.to_f

puts "==> #{first_num} + #{second_num} = #{first_num + second_num}"
puts "==> #{first_num} - #{second_num} = #{first_num - second_num}"
puts "==> #{first_num} * #{second_num} = #{first_num * second_num}"
puts "==> #{first_num} / #{second_num} = #{first_num / second_num}"
puts "==> #{first_num} % #{second_num} = #{first_num % second_num}"
puts "==> #{first_num} ** #{second_num} = #{first_num ** second_num}"
=end
