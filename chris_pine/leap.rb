=begin
calculate and return leap years between (and including) two user-provided years.
leap years are every four years (1984 & 2004), not including years divisible by 100 -
unless they are also divisible by 400 (e.g. 1600 & 2000).
=end

puts "What's the first year you'd like me to check?"
lower_s = gets.chomp
lower_i = lower_s.to_i
puts "And how about the second year?"
upper_s = gets.chomp
upper_i = upper_s.to_i

# cycle through each year starting at lower year and including upper year
# check if it is divisible by 100, 400, 4

while lower_i < upper_i
	if (lower_i % 100 == 0) && (lower_i % 400 == 0)
		puts lower_i
	elsif (lower_i % 4 == 0)
		puts lower_i
	end
	lower_i += 1
end
