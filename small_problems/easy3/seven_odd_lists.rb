=begin
*assignment*
Odd Lists
Write a method that returns an Array that contains every other element of an
Array that is passed in as an argument. The values in the returned list should
be those values that are in the 1st, 3rd, 5th, and so on elements of the
argument Array.

Examples:
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []

*problem*
input: an array passed in as an argument
output: an array that only includes the items from the odd places of the array
(aka the even index positions)
use the #select method to filter

*examples / test cases *
see above

*data structures*
arrays

*algorithm*
START
  declare method with one argument which is an array
  SET new array

  WHILE there are elements in the array to examine
    check index position of the argument array element
      IF the index position != odd
        add array element to new array
      ELSE
        move on to next element
      end
    end
    return new array
  end
END
=end

def oddities(arr)
  arr.select { |el| arr.index(el).even? }
end

oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []

# Further Exploration
=begin
Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.

Try to solve this exercise in at least 2 additional ways.
=end

# using a simple while loop
def evens(arr)
  counter = 1
  even_places = []
  while counter < arr.size
    even_places << arr[counter]
    counter += 2
  end
  even_places
end

# using #for_with_index to check the index
def evens(arr)
  even_places = []
  arr.each_with_index do |el, idx|
    even_places << el if idx.odd?
  end
  even_places
end

p evens([2, 3, 4, 5, 6]) # == [3, 5]
p evens(['abc', 'def']) # == ['def']
p evens([123]) # == []
p evens([]) # == []
