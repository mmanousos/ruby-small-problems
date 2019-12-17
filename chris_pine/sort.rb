=begin
program that asks user to type as many words as they want, one per line, until they hit 'enter'
on an empty line. Then returns all the words in alphabetical order.
=end

puts 'give me some words to organize (hit enter after each one)'
arr = []

while true
	term = gets.chomp
	if term.length == 0
		break
	else
		arr.push term
	end
end

puts 'here are your sorted words: '
puts arr.sort
