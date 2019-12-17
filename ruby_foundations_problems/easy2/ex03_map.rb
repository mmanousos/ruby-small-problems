=begin
Problem
map
Lets return to implementing existing core ruby methods to learn about blocks.

The Enumerable#map method iterates over the members of a collection, using the
associated block to perform some sort of operation on each collection member.
The returned values from the block are then built up into an Array that is then
returned to the caller. Note in particular that every time #map yields to the
block, it obtains just one value. That value may be a complex value - it may
even be another collection - but it is nevertheless just one value. Thus, #map
returns an Array that has the same number of elements that the original
collection had.

Write a method called map that behaves similarly for Arrays. It should take an
Array as an argument, and a block. It should return a new Array that contains
the return values produced by the block for each element of the original Array.

If the Array is empty, map should return an empty Array, regardless of how the
block is defined.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop,
for, while, or until to iterate through the Array passed in as an argument, but
must not use any other methods that iterate through an Array or any other
collection.

Examples

map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
map([]) { |value| true } == []
map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

Algorithm
  BEGIN
    argument is an array
    SET result = []
    return result if argument array is empty
    iterate over array
      yield each element to block
      push possibly transformed value from block evaluation to result array
    return result
  END

=end

# using #each
def map(array)
  result = []
  array.each { |el| result << yield(el) }
  result
end

# simplified using #each_with_object
def map(array)
  array.each_with_object([]) { |el, arr| arr << yield(el) }
end

# Further Exploration
# My solution does not inherently work with hashes, but does work for sets
# since they are designed similarly to arrays.
#
# In order to get my solution to work for a hash, we would need a slightly
# different implementation - taking into account the key-value pairs.

def map_hash(hash_object)
  hash_object.each_with_object([]) { |(_, v), arr| arr << yield(v) }
end

require 'set'
s1 = Set.new [1, 2]
p map(s1) { |value| value**2 } == [1, 4]

p map_hash({one: 1, two: 2, three: 3}) { |value| value**2 } == [1, 4, 9]
# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
