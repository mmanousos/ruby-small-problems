=begin
*assignment*
Multiply Lists
Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of each pair
of numbers from the arguments that have the same index. You may assume that the
arguments contain the same number of elements.

Examples:
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

*problem*
input: two arrays of integers
output: a single array the same length as the input arrays that contains the
products of each index pair

zip and map ?

*examples / test cases *
see above

*data structures*
arrays

*algorithm*
BEGIN
  declare a method that takes two arrays of integers as its arguments
    SET products_array = empty array for final product integers
    WHILE products_array.size < arr1.size
      access the integers at the same index position in both arrays
      multiply them together
      add the product to products_array
    PRINT products_array
END
=end

# using Array#zip, Enumerable#inject and Array#flatten
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |pairs| pairs.inject(:*) }.flatten
end

# Perhaps more easily read, using Array#each_with_index
def multiply_list(arr1, arr2)
  products_array = []
  arr1.each_with_index { |int, idx| products_array << int * arr2[idx] }
  products_array
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
