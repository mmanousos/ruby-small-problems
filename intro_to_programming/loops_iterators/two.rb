# Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP". Each loop can get info from the user.

# a do ... while loop
=begin
loop do
	puts "tell me something"
	answer = gets.chomp
	if answer != "STOP"
		puts "your thing backward was " + answer.reverse
	else
		break
	end
end
=end

while true
	puts "ask me a question"
	answer = gets.chomp
	puts "#{answer} What a silly question!"
	puts "want to ask something else?"
	reply = gets.chomp
	if reply == 'no'
		break
	end
end
