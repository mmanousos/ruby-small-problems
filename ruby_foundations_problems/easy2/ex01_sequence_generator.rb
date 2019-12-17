=begin
Problem
From-To-Step Sequence Generator
The Range#step method lets you iterate over a range of values where each value
in the iteration is the previous value plus a "step" value. It returns the
original range.

Write a method that does the same thing as Range#step, but does not operate on a
range. Instead, your method should take 3 arguments: the starting value, the
ending value, and the step value to be applied to each iteration. Your method
should also take a block to which it will yield (or call) successive iteration
values.

What do you think would be a good return value for this method, and why?

Example

step(1, 10, 3) { |value| puts "value = #{value}" }
value = 1
value = 4
value = 7
value = 10


Data Structure

Algorithm
  BEGIN
    arguments: start value, end value, & "step" value we will increment by
    begging with start value, add step value and yield it to block
    return new sum to repeat until end value is reached.

    reduce?
  END

=end

# Possible useful return values for this method would be the end value - so we
# know what our final value is - or both the start and end value - so, in effect,
# we know the range we have iterated over.

def step(start, stop, increment)
  result = start
  until result > stop
    yield(result)
    result += increment
  end
  result
end


step(1, 10, 3) { |value| puts "value = #{value}" }
# value = 1
# value = 4
# value = 7
# value = 10
