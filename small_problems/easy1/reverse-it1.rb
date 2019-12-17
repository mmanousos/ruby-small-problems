=begin
*Assignment*
Reverse It (Part 1)
Write a method that takes one argument, a string, and returns the same string with the words in reverse order.

Examples:
	puts reverse_sentence('') == ''
	puts reverse_sentence('Hello World') == 'World Hello'
	puts reverse_sentence('Reverse these words') == 'words these Reverse'

The tests above should print true.


*Problem*
	Input: string, allows for empty strings - assumes no non-strings will be provided.
	Output: string which each word in reverse order

*Examples / Test Cases*
see above

*Data Structures*
	input: string converted to array
	output: string converted back from array.

*Algorithm*
	Method requires one argument of a string.
	Split string into array at spaces between words.
	Reverse order of array.
	Rejoin array into string with space as delimiter.
	Return joined string
=end

def reverse_sentence(string)
	string.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
