=begin
*assignment*
Repeat Yourself
Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

Example:
	repeat('Hello', 3)
Output:
	Hello
	Hello
	Hello

*problem*
	input: string and positive integer (n)
	do not need to worry about changing cases for the string, or 0 / negative numbers.
	output: provided string printed n times (including a line break between each version of the string)

*examples / test cases*

method('hi', 1) 						=> 	'hi'
method('How are you?', 3)		=> 	'How are you?'
																'How are you?'
																'How are you?'

*data structure*
String to be able to use puts command and times method

*algorithm*
method will require two arguments, string and integer
method will include integer.times {puts string}

=end

def repeat(string, integer)
	integer.times {puts string}
end

repeat('hello', 1)
repeat('How are you?', 3)
