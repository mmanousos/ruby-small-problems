alpha = Array.new + [12345]
beta = String.new + 'hello'
karma = Time.new
karma2 = karma + 60
puts Time.local(2000, 1, 1)
puts Time.local(1976, 8, 3, 13, 31)


puts "alpha = #{alpha}"
puts "beta = #{beta}"
puts "karma = #{karma}"
puts karma2

bday = Time.local(1979, 5, 31, 20, 20)
ancient = bday + 1000000000
puts "you're 1 Billion seconds old on #{ancient}"

puts "What year were you born?"
year = gets.chomp
puts "In which month?"
month = gets.chomp
puts "And what was the day?"
day = gets.chomp

today = Time.new
birthday = Time.local(year, month, day)
diff = (today - birthday) / 60 / 60 / 24 / 365
age = diff.to_i
puts "you are #{age} years old"
age.times {puts "SPANK"}
