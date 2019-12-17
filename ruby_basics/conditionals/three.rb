# 3. Unpredictable Weather (Part 3)
# In the code below, sun is randomly assigned as 'visible' or 'hidden'.

sun = ['visible', 'hidden'].sample
# Write an if statement that prints "The sun is so bright!" if sun equals visible. Also, write an unless statement that prints "The clouds are blocking the sun!" unless sun equals visible.

# When writing these statements, take advantage of Ruby's expressiveness and use statement modifiers instead of an if...end statement to print results only when some condition is met or not met.

=begin # this works, but it's not what the authors of the problem wanted
unless sun == 'visible'
	puts 'The clouds are blocking the sun!'
else
	puts "The sun is so bright!"
end
=end

puts "The sun is so bright!" if sun == 'visible'
puts "The clouds are blocking the sun!" unless sun == 'visible'

# need to practice the in-line conditional format (modifiers) since it is backwards from the syntax I am used to of if...end 
