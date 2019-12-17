=begin
Rewrite your program from exercise 3 using a case statement. Wrap this new case statement in a method and make sure it still works.


puts "please give me a number between 0-100"
num = gets.chomp.to_i

if num <= 50
	puts "Your number is between 0-50."
elsif num <= 100
	puts "Your number is between 51-100."
else
	puts "Please try again. Your number is greater than 100."
end

=end


def between(number)
	reply = case number
	when 0..50
		"Your number is between 0-50."
	when 51..100
		"Your number is between 51-100."
	else
		"Please try again. Your number is greater than 100."
	end

	puts reply
end

puts "please give me a number between 0-100"
num = gets.chomp.to_i
between(num)
