# 2. Loopception
# The code below is an example of a nested loop. Both loops currently loop infinitely. Modify the code so each loop stops after the first iteration.

loop do
  puts 'This is the outer loop.'

	  loop do
	    puts 'This is the inner loop.'
			break # 'break' after inner loop executes once returns to outer loop
  	end

	break # 'break' after outer loop and inner loop have executed
end

puts 'This is outside all loops.'

# if 'break' within inner loop only, outer loop still executes indefinitely.
# if 'break' within outer loop, immediately after puts statement, inner loop is never executed.
