=begin
*assignment*
Halvsies
Write a method that takes an Array as an argument, and returns two Arrays that
contain the first half and second half of the original Array, respectively. If
the original array contains an odd number of elements, the middle element should
be placed in the first half Array.

Examples:
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

*problem*
input: single array
output: two arrays each containing half of the elements of the original array
if the length of the original array is odd, the first array should be one
element longer than the second to account for that discrepancy

If there is only one element, a new empty second array should still be returned.
If the array is empty, two empty arrays should be returned.

*examples / test cases *
see above

*data structures*
arrays

*algorithm*
BEGIN
  declare a method that accepts one array as an argument
    SET arr_size = length of array
    IF arr_size % 2 != 0 (is odd)
      arr1 = arr_size / 2 + 1 (pull these elements from the array - loop through removing? likely an easier way)
    ELSE
      arr1 = arr_size / 2 (pull these elements from the array)
    end
    arr2 = remaining elements
  PRINT [arr1, arr2] (nested array)
END
=end 

# a solution
def halvsies(arr)
  arr_size = arr.size
  arr1_size = arr_size / 2
  if arr_size.odd?
    arr1 = arr[0..arr1_size]
    arr2 = arr[(arr1_size+1)..-1]
  else
    arr1 = arr[0..(arr1_size-1)]
    arr2 = arr[arr1_size..-1]
  end
  [arr1, arr2]
end

# slightly refactored
def halvsies(arr)
  arr1_size = arr.size / 2
  if arr.size.odd?
    arr1 = arr[0..arr1_size]
  else
    arr1 = arr[0..(arr1_size-1)]
  end
  arr2 = arr - arr1
  [arr1, arr2]
end

# a second refactoring
def halvsies(arr)
  arr1_size = arr.size / 2
  if arr.size.odd?
    arr1 = arr[0..arr1_size]
  else
    arr1 = arr[0..(arr1_size-1)]
  end
  [arr1, (arr-arr1)]
end

# Course Solution
=begin
This is equally complex to my solution but uses fewer lines.
It uses Numeric#ceil to round up from a float when necessary where I counted on
the internal logic of ruby rounding down to a whole number and shortened the
range of values I was including in arr1 / first_half by one if the original
array contained an even number of elements.
The logic they use is more direct based on the way the problem is presented.
=end
def halvsies(array)
  first_half = array.slice(0, (array.size / 2.0).ceil)
  second_half = array.slice(first_half.size, array.size - first_half.size)
  [first_half, second_half]
end

# My refactor of the Course Solution
def halvsies(array)
  first_half = array.slice(0, (array.size / 2.0).ceil)
  [first_half, (array - first_half)]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# Further Exploration
# Can you explain why our solution divides array.size by 2.0 instead of just 2?

The float 2.0 is required for division because otherwise the internal Math
operations of Ruby would round the array size down to the closest integer.
Too few elements would be assigned to first_half and subsequently too many would
be assigned to second_half.
