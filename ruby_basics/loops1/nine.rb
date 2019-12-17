# 9. That's Odd
=begin
The code below shows an example of a for loop. Modify the code so that it only outputs i if i is an odd number.

for i in 1..100
  puts i
end
=end

for i in 1..100
  puts i if i % 2 != 0 # using a conditional allows evaluation of each number in the range before output.
	# puts i if i.odd? # also Ruby has a built in method .odd? that evaluates the same way
end
