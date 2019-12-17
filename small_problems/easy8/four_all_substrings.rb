=begin
*assignment*
All Substrings
Write a method that returns a list of all substrings of a string. The returned
list should be ordered by where in the string the substring begins. This means
that all substrings that start at position 0 should come first, then all
substrings that start at position 1, and so on. Since multiple substrings will
occur at each position, the substrings at a given position should be returned in
order from shortest to longest.

You may (and should) use the substrings_at_start method you wrote in the
previous exercise:

Examples:
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

*problem*
input: string
output: array of all substrings present in the string, sorted by index value and
then by length (shortest to longest).

Create a nested array structure so the substrings from each index position can
be sorted from shortest to longest, then the first character can be examined to
sort the arrays themselves by index, then flatten and return.

*examples / test cases *
see above

*data structures*
string to nested array to flattened array

*algorithm*
BEGIN
  declare method that takes a single string as an argument
    SET all_substrings = empty array to hold list of final return values
    SET counter = 0
    WHILE counter < string.size
      SET substring = string from counter to string.size - 1
      SET substrings_arr = return value of substrings_at_start method
      add substrings_arr to all_substrings array
      increment counter += 1


    sort substring subarrays within all_substrings by comparing first value of
    first element to value of index position of string  - e.g. examine 0 index
    character of string if it is != to 0 index of 0 element of array, next array
    should be examined until a match is found. then the subsequent index
    character should be evaluated. => unnecessary given substrings_at_start
    and the incremental nature of the external loop logic.

    PRINT all_substrings merged into a single array
END
=end

def substrings_at_start(string)
  return_array = []
  counter = 0
  while counter < string.size
    return_array << string.slice(0..counter)
    counter += 1
  end
  return_array
end

def substrings(string)
  all_substrings = []
  counter = 0
  while counter < string.size
    substring = string.slice(counter..(string.size - 1))
    all_substrings << substrings_arr = substrings_at_start(substring)
    counter += 1
  end
  all_substrings.flatten
end

# Course Solution - more refined, using Array#each and #concat
# using 0...string.size, they avoid having to convert the string into an array
# to access the index values of each characters to create the appropriate
# substrings.
# Using #concat also prevents the need to flatten the results before returning.
def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(substrings_at_start(this_substring))
  end
  results
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
p substrings('qrsaz')
