=begin
*assignment*
Running Totals
Write a method that takes an Array of numbers, and returns an Array with the
same number of elements, and each element has the running total from the
original Array.

Examples:
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

*problem*
input: array of integers
output: array of integers with the previous integer values added to each value.
access each value and add it to the value following it in the array.
reset the next value to that new, higher value.
continue until all values have been modified.
map method?

*examples / test cases *
see above

*data structures*
arrays

*algorithm*
START
  declare a method that takes array as its argument
    counter = 0
    WHILE array.length > counter
    SET value_to_add = array[counter]
    SET array[counter+1] = array[counter+1] + value_to_add
    counter += 1
END
=end

# simple loop
def running_total(arr)
  if arr.empty?
    arr
  else
    new_arr = [arr[0]]
    counter = 1
    while arr.length > counter
      new_arr << arr[counter] + new_arr[counter-1]
      counter += 1
    end
    new_arr
  end
end

=begin
to use #map, need to set a placeholder variable that keeps track of the current
total, then add that to each value in the array

def running_total(arr)
  total = 0
  arr.map {|val| total += val }
end
=end

# Further Exploration
=begin
Try solving this problem using Array#each_with_object or Enumerable#inject
(note that Enumerable methods can be applied to Arrays).
=end

# #each_with_object, basically the same as map, but more explicitly pushing
# values into new array
def running_total(arr)
  sum = 0
  arr.each_with_object([]) do |val, array|
    array << sum += val
  end
end

p running_total([2, 5, 13]) #== [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67]
p running_total([3]) #== [3]
p running_total([]) #== []

#I will need to study the #inject method more for implementing it
