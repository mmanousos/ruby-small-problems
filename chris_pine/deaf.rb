count = 0
while 'grandma' > 'apple'
	puts 'What do you want to say to your grandma?'
	says = gets.chomp
	if says == "BYE"
		count += 1
	end

	if says == "BYE" && count == 3
		break
	elsif says == says.upcase #is capitalized
		year = rand(21) + 1930
		puts 'NO, NOT SINCE ' + year.to_s + '!' #answers with random year
	else
		puts 'HUH?! SPEAK UP, SONNY!' #asks you to speak up
	end
end
