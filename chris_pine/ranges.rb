letters = 'a'..'c' # range literal
puts(['a', 'b', 'c'] == letters.to_a) # convert range to array & check if it's equal to this provided array
('A'..'z').each do |letter|
	print letter
end

puts

god_bless_the_70s = 1970..1979
puts god_bless_the_70s.min
puts god_bless_the_70s.max
puts(god_bless_the_70s.include?(1979))
puts(god_bless_the_70s.include?(1980))
puts(god_bless_the_70s.include?(1974.5))
