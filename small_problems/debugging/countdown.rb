=begin
*assignment*
Countdown
Our countdown to launch isn't behaving as expected. Why? Change the code so that
our program successfully counts down from 10 to 1.

def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'
=end

=begin
As originally written, this program is calling the variable 'counter' (the
integer 10) in the block of the #times method before it is invoking the decrease
method in the same block.
Because the decreasing counter assigned within the decrease method is never
output or returned, the counter remains at 10 for each iteration.
we have the choice to
1) do away with the decrease method all together and deincrement counter
directly in do / end block within the #times method.
=end 

counter = 10

10.times do
  puts counter
  counter -= 1
end

puts 'LAUNCH!'

=begin
Or, 2) if we want to retain the decrease method, we need to reassign counter to
the return value of the decrease method on each iteration of the #times method.
=end

def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

# Further Exploration
# We specify 10 two times, which looks a bit redundant. It should be possible to
# specify it only once. Can you refactor the code accordingly?

def decrease(counter)
  counter - 1
end

counter = 10

counter.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

# once the variable 'counter' is assigned to the integer object 10 on line 5,
# it can be used in place of the integer 10 to invoke the #times method on line
# 7 further cleaning up the code
