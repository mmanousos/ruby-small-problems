# 9. Multiply the Sum
=begin
Write the following methods so that each output is true.

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36
=end

# based on the provided code, I could tell each method needed to accept at least two arguments.
# I could have assigned them both the same parameter names, since the scope is local. But for clarity's sake, I used different ones.

def add(num1, num2)
	num1 + num2
end

def multiply(val1, val2)
	val1 * val2
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36
