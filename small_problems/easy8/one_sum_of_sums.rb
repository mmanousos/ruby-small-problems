=begin
*assignment*
Sum of Sums
Write a method that takes an Array of numbers and then returns the sum of the
sums of each leading subsequence for that Array. You may assume that the Array
always contains at least one number.

Examples:
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

*problem*
input: array of at least one integer
output: single integer that represents the sum of all the integers in the array
added incrementally. i.e. first integer, plus the sum of the first two integers,
plus the sum of the first three integers, etc.

*examples / test cases *
see above

*data structures*
array

*algorithm*
BEGIN
  declare a method that takes a single array as a method
    SET total_sum = 0 to hold total output sum
    SET counter = 1
      WHILE there are elements remaining in the array to evaluate (counter - 1 < array size)
        total_sum += sum of array including -counter
        increment counter += 1
    PRINT total_sum
END
=end

# working forward and including more elements in the sum for each pass
def sum_of_sums(arr)
  total_sum = 0
  idx = 0
  elements = 1
  while elements - 1 < arr.size
    total_sum += arr.slice(idx, elements).reduce(:+)
    elements += 1
  end
  total_sum
end

# working backwards including fewer elements in the range to sum on each pass
def sum_of_sums(arr)
  total_sum = 0
  idx = 0
  counter = -1
  while counter + 1 > -arr.size
    total_sum += arr.slice(idx..counter).reduce(:+)
    counter -= 1
  end
  total_sum
end

# Course Solution - the same logic as my first solution just using the #upto
# method instead of a basic loop 
def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
