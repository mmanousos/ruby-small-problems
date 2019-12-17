=begin
Problem
Optional Blocks
Write a method that takes an optional block. If the block is specified, the
method should execute it, and return the value returned by the block. If no
block is specified, the method should simply return the String
'Does not compute.'.

Examples:

compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'

Example / Tests

Data Structure

Algorithm
  BEGIN

  END

=end

def compute
  block_given? ? yield : 'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Course Solution
# def compute
#   return 'Does not compute.' unless block_given?
#   yield
# end

# Further Exploration
# Modify the compute method so it takes a single argument and yields that
# argument to the block. Provide at least 3 examples of calling this new
# version of compute, including a no-block call.

def compute(expression)
    block_given? ? yield(expression) : 'Does not compute.'
end

p compute(2 + 3) { |exp| exp * 8 }
p compute(2 * 5) { |exp| exp - 4 }
p compute(7 - 5)
