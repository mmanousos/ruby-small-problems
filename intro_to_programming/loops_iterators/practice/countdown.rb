x = gets.chomp.to_i

=begin
while x >= 0
	puts x
	# long way: x = x - 1
	x -= 1 # refactored
end
=end

until x < 0
	puts x
	x -= 1
end

puts "Done!"
