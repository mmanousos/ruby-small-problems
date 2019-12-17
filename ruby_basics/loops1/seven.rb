# 7. Count Up
=begin
The following code outputs a countdown from 10 to 1. Modify the code so that it counts from 1 to 10 instead.

count = 10

until count == 0
  puts count
  count -= 1
end
=end

count = 1 # change starting value 

until count > 10 # can either use greater than 10 or equal to 11 here
  puts count
  count += 1 # increment up
end
