# 10. Stoplight (Part 3)
# Reformat the following case statement so that it only takes up 5 lines.

stoplight = ['green', 'yellow', 'red'].sample

=begin
case stoplight
when 'green'
  puts 'Go!'
when 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end
=end

case stoplight
	when 'green' 	then puts 'Go!'
	when 'yellow' then puts 'Slow down!'
	else 							 puts 'Stop!'
end

# notes on formatting... aligning commands vertically simplifies reading. 
