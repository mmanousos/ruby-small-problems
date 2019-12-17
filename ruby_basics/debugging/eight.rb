# 8. Colorful Things
# The following code throws an error. Find out what is wrong and think about how you would fix it.

colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
	# break if i > colors.length # original code
	break if i == things.length # changed this line only
	# break if ((i > things.length - 1) || (i > colors.length - 1)) # to check both arrays and stop if one reaches the end.

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end

# the error comes because the length of 'colors' is greater than the length of 'things'. The error thrown says it can not convert nil to a string: basically there are no more 'things' to list even though 'colors' still has options.
# corrected the loop by changing the break conditional to assess the length of 'things' and broke when 'i' was equal to the length instead of greater than (since the array starts at 0, counting to greater than the length puts the count past the number of items in the array).

# Further exploration
=begin
We might change our arrays in the future and we might not always know which of them is shorter, so picking the shorter one by hand is not the best solution. How can you change the break condition, such that the loop always stops once we hit the end of the shorter array?
# Could break the loop if i == either things.length or colors.length.
=end
