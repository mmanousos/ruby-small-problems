# 6. Print While
=begin
Using a while loop, print 5 random numbers between 0 and 99. The code below shows an example of how to begin solving this exercise.

numbers = []

while <condition>
  # ...
end
Example output (your numbers will most likely be different):

62
96
31
16
36
=end

numbers = []
count = 0 # create a counter

while count < 6 # condition is that the counter is below our desired number of outputs
  numbers.push(rand(100)) # generate a random number between 1 - 100 and push it into the provided array
	count += 1 # increment the counter
end

puts numbers # print the values from the array

=begin
more simply can use numbers.length < 5 as the condition (removes need for a counter) and can use << "shovel" to add values to array.

numbers = []
while numbers.length < 5
  numbers << (rand(100))
end

puts numbers
=end
