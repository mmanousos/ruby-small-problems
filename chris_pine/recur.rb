def ask_recursively question
	puts question
	reply = gets.chomp.downcase
	if reply == 'yes'
		true
	elsif reply == 'no'
		false
	else
		puts 'Please answer "yes" or "no".'
		ask_recursively question
	end
end

ask_recursively 'do you like burritos?'
ask_recursively 'do you wet the bed?'
