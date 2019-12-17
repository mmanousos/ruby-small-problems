# 10. Are You There?
=begin
Using the following code, print true if colors includes the color 'yellow' and print false if it doesn't. Then, print true if colors includes the color 'purple' and print false if it doesn't.

colors = 'blue pink yellow orange'
Expected output:

	true
	false
=end

colors = 'blue pink yellow orange'

puts colors.include?('yellow')
puts colors.include?('purple')


# can also be written as a method.
def check_color(string, color)
	puts string.include?(color)
end

check_color(colors, 'yellow')
check_color(colors, 'purple')


# Further Exploration
=begin
Let's say colors is changed to the following value:

colors = 'blue boredom yellow'
and we invoke #include? as we did before:

puts colors.include?('red')
What will the output be? Why?

# It returns true because the letters 'r' 'e' 'd' are included sequentially in the word 'boredom'. This would likely be a better use for RegEx to check for exact matches.  
