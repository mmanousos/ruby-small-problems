=begin
*assignment*
Combining Arrays
Write a method that takes two Arrays as arguments, and returns an Array that
contains all of the values from the argument Arrays. There should be no
duplication of values in the returned Array, even if there are duplicates in the
original Arrays.

Example
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

*problem*
input: two arrays
output: single array with no duplicated elements

assume elements can be of any datatype.
assume only two arrays
assume arrays can have different number of arguments
assume array is not empty and does not include nil values

*examples / test cases *
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
merge([nil, true, 8], [5, 7, 9, nil]) = [nil, true, 8, 5, 7, 9]
merge([''], [8, 0]) = ['', 8, 0]
merge([], [false, 10, 5]) = [false, 10, 5]

*data structures*
arrays

*algorithm*
BEGIN
  declare method that takes two arrays as arguments
    arr1 merge into arr2 and filter for unique values
    PRINT new combined array
END
=end

# My solution for test case and my additional edge cases.
# (Array#zip works best with arrays of the same size - if there are elements in
# an index position in one array that do not have corresponding element in that
# index position in the other array(s), nil values are inserted in their place
# presuming the longer array is first.)
def merge(arr1, arr2)
  if arr1.size < arr2.size
    arr1, arr2 = arr2, arr1
  end
  arr1.zip(arr2).flatten.uniq.delete_if do |el|
    el == nil && arr1.include?(nil) == false && arr2.include?(nil) == false
  end
end

# Simple solution only for course-provided test
def merge(arr1, arr2)
  arr1.zip(arr2).flatten.uniq.sort
end

# Course Solution
# This is my first introduction to the Array#| (set union) method which removes
# duplicates but preserves array order and data type integrity, including nested
# arrays, boolean and nil values.
def merge(array_1, array_2)
  array_1 | array_2
end

p merge([1, 3, 5], [3, 6, 9]) # == [1, 3, 5, 6, 9]
p merge([nil, true, 8], [5, 7, 9, nil]) # == [nil, true, 8, 5, 7, 9]
p merge([''], [8, 0]) # == ['', 8, 0]
p merge([3, [7, 8]], [false, 10, 5]) # == [3, 7, 8, false, 10, 5]
