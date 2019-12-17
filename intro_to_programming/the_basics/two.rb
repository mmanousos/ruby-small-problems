=begin
Use the modulo operator, division, or a combination of both to take a 4 digit number and find the digit in the:
1) thousands place 2) hundreds place 3) tens place 4) ones place
=end

num = 1576

thousands_place = num / 1000

hundreds_place = (num % 1000) / 100

tens_place = ((num % 1000) % 100) / 10

ones_place = (((num % 1000) % 100) % 10)

puts "num is: #{num}"
puts "thousands place: #{thousands_place}; hundreds place: #{hundreds_place}; tens place: #{tens_place}; ones place: #{ones_place}"
