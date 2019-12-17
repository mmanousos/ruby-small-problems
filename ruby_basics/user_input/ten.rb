# 10. Opposites Attract
=begin
Write a program that requests two integers from the user, adds them together, and then displays the result. Furthermore, insist that one of the integers be positive, and one negative; however, the order in which the two integers are entered does not matter.

Do not check for positive/negative requirement until after both integers are entered, and start over if the requirement is not met.

You may use the following method to validate input integers:

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end
Examples:

$ ruby opposites.rb
>> Please enter a positive or negative integer:
8
>> Please enter a positive or negative integer:
0
>> Invalid input. Only non-zero integers are allowed.
>> Please enter a positive or negative integer:
-5
>> 8 + -5 = 3

$ ruby opposites.rb
>> Please enter a positive or negative integer:
8
>> Please enter a positive or negative integer:
5
>> Sorry. One integer must be positive, one must be negative.
>> Please start over.
>> Please enter a positive or negative integer:
-7
>> Please enter a positive or negative integer:
5
-7 + 5 = -2
=end

=begin # pseudocode
define two variables to hold our two user-provided values
Can use 2 loops or a nested loop for this because the order doesn't matter.
but 2 loops requires checking after each entry instead of waiting for both values to be gathered.
loop:
ask for two numbers, requesting that one is positive and one is negative
assign each to a variable
check if one is positive and one is negative.
break if true.
if false, print an error messgae
print the calculation (number1 + number2 = sum)
=end




def valid_number?(number_string)
	number_string.to_i.to_s == number_string && number_string.to_i != 0
end

num1 = nil
num2 = nil

# two loops
=begin
loop {
	puts '>> What is your first positive or negative number?'
	num1 = gets.chomp
	break if valid_number?(num1)
	puts '>> Invalid input. Only non-zero integers are allowed.'
}

loop {
	puts '>> What is your second positive or negative number?'
	num2 = gets.chomp
	break if valid_number?(num2)
	puts '>> Invalid input. Only non-zero integers are allowed.'
}

num1 = num1.to_i
num2 = num2.to_i

if (((num1 < 0) || (num2 < 0)) && ((num1 > 0) || (num2 > 0))) # one value is positive and other is negative (but only 1)
puts "#{num1} + #{num2} = #{num1 + num2}"

=end

# nested loop
=begin
loop {
	puts '>> Please give me a positive or negative number: '
	num1 = gets.chomp
	if !(valid_number?(num1))
		puts '>> Invalid input. Only non-zero integers are allowed.'
	else
		loop {
			puts '>> Please give me a positive or negative number: '
			num2 = gets.chomp
			if valid_number?(num2)
			  break
			else
				puts '>> Invalid input. Only non-zero integers are allowed.'
			end
		}
	end
	num1 = num1.to_i
	num2 = num2.to_i
	break if (((num1 < 0) || (num2 < 0)) && ((num1 > 0) || (num2 > 0))) # one value is positive and other is negative (but only 1)
}

puts "#{num1} + #{num2} = #{num1 + num2}"
=end

# method (to call within loop)

def get_num
	puts '>> Please give me a positive or negative number: '
	num = gets.chomp
	if !(valid_number?(num))
		puts '>> Invalid input. Only non-zero integers are allowed.'
	end
	num = num.to_i
end

# course version of method includes a loop which makes sense so you can keep checking if someone just isn't paying attention that it needs to be an integer.
=begin
def get_num
	loop
		puts '>> Please give me a positive or negative number: '
		num = gets.chomp
		return num = num.to_i if valid_number?(num)
		puts '>> Invalid input. Only non-zero integers are allowed.'
	end
end
=end

loop {
	num1 = get_num
	num2 = get_num
	break if (((num1 < 0) || (num2 < 0)) && ((num1 > 0) || (num2 > 0))) # one value is positive and other is negative (but only 1)
	# break if first_number * second_number < 0  more streamlined way to check for negative number
	puts '>> Please try again: one number must be positive and one negative.'
}

puts "#{num1} + #{num2} = #{num1 + num2}"
