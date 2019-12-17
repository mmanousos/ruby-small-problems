# 2. Catch the Number
=begin
Modify the following code so that the loop stops if number is between 0 and 10.

loop do
  number = rand(100)
  puts number
end
=end

loop do
  number = rand(100)
	puts number
	break if number < 11 # since rand generates random numbers between 0-100, setting the loop to break if the number is less than 11 meets the criteria.
end

# can also use method '.between?(0, 10)' to check if the number is between 0-10. 
