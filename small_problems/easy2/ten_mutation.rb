=begin
*assignment*
Mutation
What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=end

# first answer
=>
Moe
Larry
Curly
Shemp
Harpo
Chico
Groucho
Zeppo

The code loops through and pushes the original values to the new array 'array2'.
Then it mutates all the names starting with 'C' or 'S' in 'array1' to uppercase
but because 'array2' is a new object, it is not referring to the original
'array1'. So when the puts call is executed, the unaltered contents of 'array2'
are printed (identical to 'array1' when it was first assigned).


# revised understanding after running the code
=>
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo

The code loops through and pushes the original values to the new array 'array2'.
Then it mutates all the names starting with 'C' or 'S' in 'array1' to uppercase.
Even though 'array2' is a new object, the values within it are pointing to the
string objects within 'array1'. So when the puts call is executed, the altered
contents of 'array1' are reflected.
