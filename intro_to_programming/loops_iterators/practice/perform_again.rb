
loop do
	puts "do you want to do that again?"
	answer = gets.chomp
	if answer != 'Y'
		break
	end
end

=begin
# alternate format - not recommended (less intuitive?)
begin
  puts "Do you want to do that again?"
  answer = gets.chomp
end while answer == 'Y'
=end

=begin
# standard while loop
answer = gets.chomp
while answer == 'Y'
	puts 'do you want to do that again?' # creates infinite loop because never checks for new answer
	if answer != 'Y'
		break
	end
end
=end
