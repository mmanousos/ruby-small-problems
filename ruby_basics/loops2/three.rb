# 3. Conditional Loop
# Using an if/else statement, run a loop that prints "The loop was processed!" one time if process_the_loop equals true. Print "The loop wasn't processed!" if process_the_loop equals false.

process_the_loop = [true, false].sample
puts process_the_loop

=begin
# this is a loop that includes both conditions. not what the assignment is asking for.
loop do
	if process_the_loop
		puts "The loop was processed!"
	else
		puts "The loop wasn't processed!"
	end
	break
end
=end

if process_the_loop
	loop do
		puts "The loop was processed!"
		break
	end
else
	puts "The loop wasn't processed!"
end


# I was not familiar with the method '.sample' before this exercise
