# 3. Control the Loop
# Modify the following loop so it iterates 5 times instead of just once.

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
	iterations += 1 # added a way for the variable 'iterations' to be incremented
	if iterations > 5 # added a conditional statment to check if that variable was larger than the number of times we want the loop to output
  	break # if so, the program breaks.
	end
end

# The conditional statment can also be written as 'break if iterations > 5' to minimize lines of code
# Alternately could use 'puts 5.times' but this would output the same string each time. 
