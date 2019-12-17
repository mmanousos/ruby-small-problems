=begin
*assignment*
Name Swapping
Write a method that takes a first name, a space, and a last name passed as a
single String argument, and returns a string that contains the last name, a
comma, a space, and the first name.

Examples:
swap_name('Joe Roberts') == 'Roberts, Joe'

*problem*
input: single string that includes first name, space, and last name
output: single string with last name, comma, space, first name

*examples / test cases *
see above

*data structures*
strings

*algorithm*
BEGIN
  declare method that takes a single string as an argument
    SET arr = array of original string broken into substrings at space
    Swap arr[0], arr[1] = arr[1], arr[0]
    str = arr joined with ", " as delimiter
END
=end

def swap_name(str)
  arr = str.split
  arr[0], arr[1] = arr[1], arr[0]
  str = arr.join(', ')
end

# Course Solution - same logic but using method Array#reverse simplifies it
def swap_name(name)
  name.split(' ').reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
