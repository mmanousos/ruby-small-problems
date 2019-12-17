=begin
Old school roman numerals
write a method that converts any integer into roman numerals
straight additon, largest to smallest e.g. 9 = VIIII
I = 1; V = 5; X = 10; L = 50; C = 100; D = 500; M = 1000
=end

def roman_old
	puts 'What number would you like to convert to old school Roman?'
	vals = [1000, 500, 100, 50, 10, 5, 1]
	sym = ['M', 'D', 'C', 'L', 'X', 'V', 'I']
	roman = []
	num = gets.chomp.to_i
	puts 'your number to convert is ' + num.to_s
	while true
		if num == 0
			break
		end
		vals.each_with_index do |el, index|
			puts 'the current element of "vals" array is ' + el.to_s
			puts 'the current index position of "vals" array is ' + index.to_s
			if (num % el >= 0)
				times_present = num / el
				num = num - ( times_present * el )
				roman.push sym[index.to_i]*times_present # add symbol corresponding to current el from sym array
			end
		end
	end
	print 'And your Roman number is ' + roman.join
end

roman_old
# roman_old 45 => XXXXV
# roman_old 22 => XXII
# roman_old 73 => LXXIII
# roman_old 97 => LXXXXVIIII
# roman_old 2005 => MMV


=begin
for each place value, check if the number is divisble by that value
then by how many times
subtract that amount from the number
push that number of the appropriate symbols to an array, then join the array to return the final value.
=end
