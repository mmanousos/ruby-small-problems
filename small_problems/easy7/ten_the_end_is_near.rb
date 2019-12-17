=begin
*assignment*
The End Is Near But Not Here
Write a method that returns the next to last word in the String passed to it as
an argument.
Words are any sequence of non-blank characters.
You may assume that the input String will always contain at least two words.

Examples:
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

*problem*
input: string
output: string that is the second to last word of the original string

*examples / test cases *
see above

*data structures*
strings

*algorithm*
BEGIN
  declare a method that takes a single string as an argument
    split the string into an array of words
    PRINT the -2 index word of the array
END
=end

def penultimate(str)
  str.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
