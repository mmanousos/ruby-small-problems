=begin
Problem
max_by
The Enumerable#max_by method iterates over the members of a collection, passing
each element to the associated block. It then returns the element for which the
block returned the largest value.

Write a method called max_by that behaves similarly for Arrays. It should take
an Array and a block, and return the element that contains the largest value.

If the Array is empty, max_by should return nil.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop,
for, while, or until to iterate through the Array passed in as an argument, but
must not use any other methods that iterate through an Array or any other
collection.

Examples
max_by([1, 5, 3]) { |value| value + 2 } == 5
max_by([1, 5, 3]) { |value| 9 - value } == 1
max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
max_by([-7]) { |value| value * 3 } == -7
max_by([]) { |value| value + 5 } == nil


Algorithm
  BEGIN
    array as argument
    SET max_value = 0
    iterate over argument, passing each element to the block
    if block evaluates as > max_Value, set element as new value for max_value
    return max_value
  END
=end

def max_by(array)
  max_value = nil
  calculated = nil
  array.each_with_index do |el, index|
    value = yield(el)
    calculated = value if index == 0
    if value >= calculated
      max_value = el
      calculated = value
    end
  end
  max_value
end

# Course Solution - same idea but phrased slightly more efficient
def max_by(array)
  return nil if array.empty?

  max_element = array.first
  largest = yield(max_element)

  array[1..-1].each do |item|
    yielded_value = yield(item)
    if largest < yielded_value
      largest = yielded_value
      max_element = item
    end
  end

  max_element
end


p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
