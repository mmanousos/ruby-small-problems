=begin
Problem
Find Missing Numbers
Write a method that takes a sorted array of integers as an argument, and
returns an array that includes all of the missing integers (in order) between
the first and last elements of the argument.

Example / Tests

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

Data Structure

Algorithm
  BEGIN
    create new empty array to return missing numbers
    iterate over array argument
      evaluate each number
      add next largest integer to new array
    compare new array to argument array
      if numbers appear in original array, discard
      if any values are larger than the last value in the original array, discard

    OR
    create new empty array to return missing numbers
    create non-inclusive range using second and last values of argument array
    iterate over range
      evaluate each number
        add it to the new array if it is not present in the original array

    OR
    Create a new array from the non-inclusive range between the second and last array elements
    iterate over new array rejecting itemsif they are present in the original array
    return new array
  END

=end

def missing(array)
  (array.first...array.last).each_with_object([]) do |number, missing_integers|
    missing_integers << number if array.index(number) == nil
  end
end

def missing(array)
  [*array.first...array.last].reject do |number|
    number if array.index(number) != nil
  end
end

# Course Solution - far more targeted
def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
