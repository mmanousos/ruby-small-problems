=begin
*assignment*
Alphabetical Numbers
Write a method that takes an Array of Integers between 0 and 19, and returns an
Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve,
thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Examples:
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

*problem*
input: an array of integers (0 - 19)
output: an array of integers sorted based on the English word value of each

Establish a constant to hold an array with the english word equivalent of each
number. The index value of each word corresponds to its English word.

Map each integer value to its corresponding English word
Sort the values by alphabetic value
Remap the words to integers
Return the array of integers

*examples / test cases *
see above

*data structures*
arrays for input and output

*algorithm*
BEGIN
  ENGLISH_NUMS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven',
  'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen',
  'sixteen', 'seventeen', 'eighteen', 'nineteen']

  declare a method that takes one array as an argument
    SET english_integers = new array to hold the English words

    WHILE there are integers in the array to examine
      check each integer and convert it to the corresponding English word from
      ENGLISH_NUMS by index value
      place words into english_integers array

    sort english_integers array in ascending order by ASCII value

    SET sorted_integers = new array to hold integers
    WHILE There are words in english_integers to examine
      cycle through each word and convert it back to its numerical value using
      values and indexes of ENGLISH_NUMS
      place integers into sorted_integers array

    PRINT sorted_integers array
END
=end

ENGLISH_NUMS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven',
'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen',
'sixteen', 'seventeen', 'eighteen', 'nineteen']

# long way
def alphabetic_number_sort(integer_array)
  english_integers = integer_array.map { |int| ENGLISH_NUMS[int] }
  english_integers.sort!
  sorted_integers = english_integers.map { |word| ENGLISH_NUMS.index(word) }
end

# chained methods
def alphabetic_number_sort(int_arr)
  int_arr.map { |int| ENGLISH_NUMS[int] }.sort.map { |word| ENGLISH_NUMS.index(word) }
end

# course solution - Ennumerable#sort_by - saves mapping to words and back
def alphabetic_number_sort(integer_array)
  integer_array.sort_by { |int| ENGLISH_NUMS[int] }
end

# additional way to use Enumerable#sort - from student solutions
# compares values from ENGLISH_NUMS array without converting the integer values
def alphabetic_number_sort(num_arr)
  num_arr.sort { |a, b| ENGLISH_NUMS[a] <=> ENGLISH_NUMS[b] }
end

p alphabetic_number_sort((0..19).to_a)  == [
 8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]

# Further Exploration
# Why do you think we didn't use Array#sort_by! instead of Enumerable#sort_by?
sort_by! is unnecessary in this solution because the sorted array is the return
value (but it would also work).
