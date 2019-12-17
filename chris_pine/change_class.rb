=begin
class Integer
	def to_eng
		if self == 5
			english = 'five'
		else
			english = 'forty-two'
		end
		english
	end
end

puts 5.to_eng
puts 42.to_eng
=end

# 4.to_roman
=begin
class Integer
	def to_roman
		if self == 4
			roman = 'IV'
		end
		roman
	end
end

puts 4.to_roman
=end

=begin
class Integer
	def factorial
		# condition ? true : false  - this one trigers recursion!
		(self <= 1) ? 1 : self * (self-1).factorial
	end
end
=end

=begin
class Integer
	def factorial
		if self <= 1
			product = 1
		else
			product = self * (self-1).factorial
		end
		product
	end
end


puts 3.factorial
=end

=begin
# demonstration of defining additional class
class Die
	def roll
		rand(7)
	end
end

dice = [Die.new, Die.new]

dice.each do |die|
	puts die.roll
end
=end

# demonstration of defining instance variables for addtional class
class Die
	def initialize
		roll
	end
	def roll
		@number_showing = 1 + rand(6)
	end
	def showing
		@number_showing
	end
	def set_side
		puts 'what number do you want?'
		num = gets.chomp.to_i
		if (num <= 6) 
			 @number_showing = num
		 else
			 puts "try again. give me a number between 1-6."
		end
	end
end

puts Die.new.set_side

=begin
die = Die.new

die.roll
puts die.showing
puts die.showing
die.roll
puts die.showing
puts die.showing
=end
