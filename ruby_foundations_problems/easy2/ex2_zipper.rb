=begin
Problem
Zipper
The Array#zip method takes two arrays, and combines them into a single array in
which each element is a two-element array where the first element is a value
from one array, and the second element is a value from the second array, in
order. For example:

[1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
Write your own version of zip that does the same type of operation. It should
take two Arrays as arguments, and return a new Array (the original Arrays should
not be changed). Do not use the built-in Array#zip method. You may assume that
both input arrays have the same number of elements.

Example
zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]


Algorithm
  BEGIN
    argument is two arrays of the same length.
    SET result = []
    SET index = 0 to represent our position in the arrays
    itrate through each array
      SET new_arr = []
      get value at index from each array and pass into new_arr
      increment index += 1
    add new_arr to result
    repeat until size of result == size of either argument array
  END

=end

def zip(arr1, arr2)
  result = []
  index = 0
  until result.size == arr1.size
    new_arr = []
    new_arr << arr1[index] << arr2[index]
    result << new_arr
    index += 1
  end
  result
end

# Course Solution - slightly more refined because skip creation of new_arr by
# defining elements as within an array explictly.
# def zip(arr1, arr2)
#   result = []
#   index = 0
#   length = array1.length
#   while index < length
#     result << [arr1[index], arr2[index]]
#     index += 1
#   end
#   result
# end

# or using #each_with_index
# def zip(arr1, arr2)
#   result = []
#   arr1.each_with_index { |el, idx| result << [el, arr2[idx]] }
#   result
# end

# or #each_with_object & #each_with_index
# def zip(arr1, arr2)
#   arr1.each_with_index.with_object([]) do |(el, idx), result|
#     result << [el, arr2[idx]]
#   end
# end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
p zip([6, 7, 8], [9, 10, 11]) == [[6, 9], [7, 10], [8, 11]]
p zip([6, 7, 8], [9, 10, 11, 12]) == [[6, 9], [7, 10], [8, 11]]
p zip([6, 7, 8, 9], [9, 10, 11]) == [[6, 9], [7, 10], [8, 11], [9, nil]]
