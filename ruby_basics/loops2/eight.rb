# 8. Only Even
=begin
Using next, modify the code below so that it only prints even numbers.

number = 0

until number == 10
  number += 1
  puts number
end
=end


number = 0

until number == 10
	number += 1
	if number.odd? # can also be written in one line as "next if number.odd?" and exclude the "end"
		next
	end
  puts number
end

=begin
Further Exploration
Why did "next" have to be placed after the incrementation of number and before "#puts"?

# If next were placed after "puts", all numbers would be printed.
# If it were placed before the incrementation, the first iteration would be false, so the incrementation would take place and 1 would print.
# Then the program would stall because it didn't know what action to do because there's nothing "next" is referring to.

=end
