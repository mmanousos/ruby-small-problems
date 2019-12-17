# Write a method that counts down to zero using recursion.

puts "Give me a number positive number"
number = gets.chomp.to_i

def counting(num)
	if num < 0
		puts "your number is too low, try again."
	else
		puts num
		num -= 1
		if num >= 0
			counting(num)
		end
	end
end

counting(number)
