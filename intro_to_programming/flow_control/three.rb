=begin
Write a program that takes a number from the user between 0 and 100 and reports back whether the number is between 0 and 50, 51 and 100, or above 100.
=end

puts "please give me a number between 0-100"
num = gets.chomp.to_i

if num <= 50
	puts "Your number is between 0-50."
elsif num <= 100
	puts "Your number is between 51-100."
else
	puts "Please try again. Your number is greater than 100."
end
