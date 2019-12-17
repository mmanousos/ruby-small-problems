=begin
*assignment*
Combine Two Lists
Write a method that combines two Arrays passed in as arguments, and returns a
new Array that contains all elements from both Array arguments, with the
elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same
number of elements.

Example:
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

*problem*
input: two non-empty arrays of equal size
output: a single array with the contents of the two arrays alternating

This is a perfect problem to use Array#zip and Array#flatten.

*examples / test cases *
see above

*data structures*
arrays

*algorithm*
BEGIN
  declare a method that takes two arrays as arguments
    SET woven_array = new empty array to hold the return value
    SET counter = 0
    WHILE woven_array.size < sum of both arrays.size
      access the counter index element of the first array
      add it to woven_array
      access the counter index element of the second array
      add it to woven_array
      increment counter += 1
    end
    PRINT woven_array
END
=end

# built in Array#zip and Array#flatten methods
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

# straight forward loop
def interleave(arr1, arr2)
  woven_array = []
  counter = 0
  while woven_array.size <= (arr1.size + arr2.size - 2)
    woven_array << arr1[counter] << arr2[counter]
    counter += 1
  end
  woven_array
end

# Course solution - identical to my logic, just uses one of the built in
# methods (Array#each_with_index) to do the looping instead & therefore doesn't
# have the same concern about running too many loops, infinite looping, etc. 
def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
