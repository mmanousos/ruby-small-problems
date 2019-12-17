=begin
Current roman numerals
write a method that converts any integer into roman numerals
largest to smallest but with subtraction so e.g. 4 = IV; 9 = IX
I = 1; V = 5; X = 10; L = 50; C = 100; D = 500; M = 1000
=end

def roman_new
	vals = [1000, 500, 100, 50, 10, 5, 1]
	sym = ['M', 'D', 'C', 'L', 'X', 'V', 'I']
	alt = [900, 400, 90, 40, 9, 4]
	alt_sym = ['CM', 'DC', 'XC', 'XL', 'IX', 'IV']
	roman = []
	puts 'What number would you like to see as a Roman Numeral?'
	num = gets.chomp.to_i
	while true
		if num == 0
			break
		end

		vals.each_with_index do |el, index|
			if (num % el >= 0)
				times_present = num / el
				num = num - ( times_present * el )
				roman.push sym[index.to_i]*times_present
				alt.each_with_index do |el, index|
					if (num == el)
						roman.push alt_sym[index]
						num = num - num
						puts num
					end
				end
			end
		end
	end
	puts 'Your Roman Numeral is: ' + roman.join
end

roman_new

# roman_new 90 => XC
# roman_new 45 => XLV
