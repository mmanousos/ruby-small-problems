# Fixed Array
# A fixed-length array is an array that always has a fixed number of elements.
# Write a class that implements a fixed-length array, and provides the necessary
# methods to support the following code:

class FixedArray
  def initialize(size)
    # new array with `size` number of `nil` placeholders
    @arr = Array.new(size)
    # my original solution = not ideal
    # @arr = [] => create empty array
    # size.times { @arr << nil } => the requisite number of times, add nil to the array
    # arr => return the array 
  end

  def [](idx)
    @arr.fetch(idx) # without using `fetch`, no IndexError will be raised if its out of range
  end

  def []=(idx, value)
    @arr[idx] = value # uses above created method to assign value
  end

  def to_a
    @arr.clone # returns a copy of the array, so the original can not be modified
  end

  def to_s
    to_a.to_s # returns a string version of the copied array
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

# The above code should output true 15 times.
