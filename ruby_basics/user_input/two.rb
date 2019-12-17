# 2. Your Age in Months
=begin
Write a program that asks the user for their age in years, and then converts that age to months.

Examples:

$ ruby age.rb
>> What is your age in years?
35
You are 420 months old.
=end

puts ">> How many years old are you?"
age = gets.chomp.to_i * 12 # get the input, clip enter, convert it to a number and multiply by 12
puts "You are #{age} months old."

=begin
Further Exploration
What happens if you enter a non-numeric value for the age?

# non-numeric values are translated to 0 with #to_i
# to prevent that being returned, we could create an if else conditional that evaluates the inuput before converting and nest it in a do...while loop so it will continue running until a valid entry is input.
# program could request that they input a positive integer first

loop do
	puts ">> How many years old are you?"
	age = gets.chomp.to_i
	if age <= 0
		puts "please use a positive integer"
	else
		months = age * 12
		puts "You are #{months} months old."
		break
	end
end
=end
