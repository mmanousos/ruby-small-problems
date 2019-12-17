=begin
Problem
Iterators: True for One?
In the previous 3 exercises, you developed methods called any?, all?, and none?
that are similar to the standard Enumerable methods of the same names. In this
exercise, you will develop one last method from this family, one?.

Enumerable#one? processes elements in a collection by passing each element value
to a block that is provided in the method call. If the block returns a value of
true for exactly one element, then #one? returns true. Otherwise, #one? returns
false. Note in particular that #one? will stop searching the collection the
second time the block returns true.

Write a method called one? that behaves similarly for Arrays. It should take an
Array as an argument, and a block. It should return true if the block returns
true for exactly one of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block
returns true a second time.

If the Array is empty, one? should return false, regardless of how the block is
defined.

Your method may not use any standard ruby method that is named all?, any?,
none?, or one?.

Examples

one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
one?([1, 3, 5, 7]) { |value| true }           # -> false
one?([1, 3, 5, 7]) { |value| false }          # -> false
one?([]) { |value| true }                     # -> false


Data Structure

Algorithm
  BEGIN
    array as argument
    return false if array is empty
    counter = 0
    WHILE counter <= 1
      iterate over array passing values to block
      return false if counter > 1
      if block evaluates to true, counter += 1
    END
    return true if counter == 1
  END

=end

# longform using a standard loop
# def one?(array)
#   return false if array.empty?
#   index = 0
#   counter = 0
#   loop do
#     break if index > array.size - 1
#     return false if counter > 1
#     counter += 1 if yield(array[index])
#     index += 1
#   end
#   counter == 1
# end

# using each 
def one?(array)
  return false if array.empty?
  counter = 0
  array.each do |el|
    counter += 1 if yield(el)
    return false if counter > 1
  end
  counter == 1
end

# works for all tests but doesn't break when 2nd true value is encountered
# def one?(array)
#   return false if array.empty?
#   return false if array.count { |el| yield(el)  } != 1
#   true
# end


p one?([1, 3, 5, 6]) { |value| value.even? }      == true
p one?([1, 3, 5, 7]) { |value| value.odd? }       == false
p one?([2, 4, 6, 8]) { |value| value.even? }      == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 }   == true
p one?([1, 3, 5, 7]) { |value| true }             == false
p one?([1, 3, 5, 7]) { |value| false }            == false
p one?([]) { |value| true }                       == false
