=begin
*assignment*
Reversed Arrays (Part 1)
Write a method that takes an Array as an argument, and reverses its elements in
place; that is, mutate the Array passed into this method. The return value
should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Examples:
list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
list == ["abc"]

list = []
reverse!(list) # => []
list == []

*problem*
input: array
output: the same array with the contents reversed

if the elements of the array are strings, the strings themselves do not need to
be reversed, only the order of the string elements.

*examples / test cases *
see above

*data structures*
arrays

*algorithm*
BEGIN
  declare a method that takes a single array as an argument
    SET counter = -1
    SET size = array.size
    WHILE there are elements in the array to assess
      remove element from front of the array
      add it to the back of the array (by adding it to the index position of counter)
      deincrement counter (-= 1)
      break when counter == negative value of size
END
=end

# My Solution
def reverse!(list)
  counter = -1
  size = list.size
  while counter >= -size
    first = list.shift
    list.insert(counter, first)
    counter -= 1
  end
  list
end

# Course Solution
=begin
I appreciate that they swapped the elements in place with a single reassignment.
However, I find my solution more intuitive as it only requires one counter.
This is also similar to what I originally started thinking about but I wasn't
sure how to determine the stopping point in the middle of the array.
As they point out, this is how the built-in ruby method Array.reverse!
works, so it's good to know that's what's going on under the hood.
=end
def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
list == ["abc"]

list = []
reverse!(list) # => []
list == []
