=begin
*assignment*
Sum or Product of Consecutive Integers
Write a program that asks the user to enter an integer greater than 0, then asks
if the user wants to determine the sum or product of all numbers between 1 and
the entered integer.

Examples:
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.

>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

*problem*
input: user string to represent integer
       user string to represent desired action (s for sum, p for product)
output: string including action, calculated values and result of calculation

*examples / test cases *
see above

*data structures*
input:
string => integer
string => string
output:
string including calulated integers

*algorithm*
START
  LOOP
    PUT '>> Please enter an integer greater than 0:'
    GET and SET num

    break if num.to_i > 0
    PUT 'Please enter a number higher than 0.'
    return num
  end

  SET numbers = an array of all integers from 1 - num

  LOOP
    PUT '>> Enter 's' to compute the sum, 'p' to compute the product.'
    GET and SET compute

    break if compute == 's' or 'p'
    PUT "I don't understand. Please use 's' to add or 'p' to multiply"
    return compute
  end

  IF compute == 's'
    action = 'sum'
    result = sum numbers
  ELSE
    action = 'product'
    result = multiply numbers
  end

PRINT "The " + action + " of the integers between 1 and " + num +  " is " +
      result + ".""

END

=end

num = 0
compute = nil

loop do
  puts '>> Please enter an integer greater than 0:'
  num = gets.chomp.to_i

  break if num > 0
  puts 'Please enter a number higher than 0.'
end

numbers = (1..num).to_a

loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  compute = gets.chomp.downcase
  break if compute == 's' || compute == 'p'

  puts "I don't understand. Please use 's' to add or 'p' to multiply"
end

case compute
when 's'
  action = 'sum'
  result = numbers.sum
when 'p'
  action = 'product'
  result = numbers.inject(:*)
end

puts "The #{action} of the integers between 1 and #{num} is #{result}."
