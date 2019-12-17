# 8. Dividing Numbers
=begin
Write a program that obtains two Integers from the user, then prints the results of dividing the first by the second. The second number must not be 0, and both numbers should be validated using this method:

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end
This method returns true if the input string can be converted to an Integer and back to a string without loss of information, false otherwise. It's not a perfect solution in that some inputs that are otherwise valid (such as 003) will fail, but it is sufficient for this exercise.

Examples:

$ ruby division.rb
>> Please enter the numerator:
8
>> Please enter the denominator:
2
>> 8 / 2 is 4

$ ruby division.rb
>> Please enter the numerator:
8.3
>> Invalid input. Only integers are allowed.
>> Please enter the numerator:
9
>> Please enter the denominator:
4
>> 9 / 4 is 2


$ ruby division.rb
>> Please enter the numerator:
10
>> Please enter the denominator:
a
>> Invalid input. Only integers are allowed.
>> Please enter the denominator:
0
>> Invalid input. A denominator of 0 is not allowed.
>> Please enter the denominator:
5
>> 10 / 5 is 2
=end

=begin #pseudocode
define numerator and denominator as nil.

loop:
ask for numerator (number to divide)
convert input to a number and store to a variable
run numerator through the provided method to confirm it is a valid number
if valid break
else indicate there was an error & run again.

loop:
ask for a denominator (number of times to divide)
convert input to a number and store to a variable
run denominator through the provided method to confirm it is a valid number
if valid break
else indicate there was an error & run again.

 can these be nested loops?

convert both values to integers

print 'numerator / denominator equals quotient'

=end

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil
denominator = nil

loop {
	puts '>> Please provide a numerator (number to divide): '
	numerator = gets.chomp
	break if valid_number?(numerator)
	puts '>> Invalid input. Only integers are allowed.'
}

loop {
	puts '>> Please provide a denominator (how many times to divide): '
	denominator = gets.chomp
	if denominator == 0
		puts '>> Division by 0 is incalculable.'
	else
		break if valid_number?(denominator)
		puts '>> Invalid input. Only integers are allowed.'
	end
}

puts "#{numerator} / #{denominator} is #{numerator.to_i / denominator.to_i}"
