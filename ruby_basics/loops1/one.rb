# 1. Runaway Loop
# The code below is an example of an infinite loop. The name describes exactly what it does: loop infinitely. This loop isn't useful in a real program, though. Modify the code so the loop stops after the first iteration.

loop do
  puts 'Just keep printing...'
	break # adding this line to instruct the program to exit immediately
end
