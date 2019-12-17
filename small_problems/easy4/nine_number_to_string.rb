=begin
*assignment*
Convert a Number to a String!
In the previous two exercises, you developed methods that convert simple numeric
strings to signed Integers. In this exercise and the next, you're going to
reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a
string representation.

You may not use any of the standard conversion methods available in Ruby, such
as Integer#to_s, String(), Kernel#format, etc. Your method should do this the
old-fashioned way and construct the string by analyzing and manipulating the
number.

Examples
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

*problem*
input: number
output: string representation of the same number
assume positive numbers or zero, no other datatypes

split the number into an array of digits and reverse them
join the array and it will convert to a string.

*examples / test cases *
see above

*data structures*
integer to an array
array to a string

*algorithm*
START
  declare method that takes one integer as an argument
    SET array = split integer into an array of its composite digits
    reverse the array
    join the array and it will be coerced into a string
END
=end

# cheater way
def integer_to_string(int)
  str = int.digits.reverse.join
end

# long way
=begin
START
  SET constant to reference integers as strings
  declare method that takes one integer as an argument
    SET array = split integer into digits and reverse them
    SET mapped array based on constant
    SET concatenate mapped array or inject (:+)
END
=end
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  str = int.digits.reverse.map { |num| DIGITS[num] }.inject(:+)
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# course solution
=begin
 def integer_to_string(number)
   result = ''
   loop do
     number, remainder = number.divmod(10)
        #divmod method breaks number into segments based on the agument. In this case, it is broken by dividing by 10 to get each place value.
        # the smallest place is assigned as the 'remainder' while the rest is reassigned to number.
     result.prepend(DIGITS[remainder])
        # the 'remainder' is used to look up the corresponding string value in the array and added to the beginning of the 'result' string.
     break if number == 0
   end
   result
 end
=end

# Further Exploration
=begin
How many mutating String methods can you find that do not end with a !?
Can you find any that end with a !, but don't have a non-mutating form?
Does the Array class have any methods that fit this pattern?
How about the Hash class?
=end

* mutating string methods without ! *
<< (concatenates or joins argument to the end of the string)
[]= (element assignment)
clear (clears string)
concat (concatenates or joins, see <<)
insert (injects string at given index)
prepend (adds argument at the start of the string)
replace (swaps value of string for argument of the method)

* string methods that end with ! and do not have non-mutating counterpart *
none

* mutating array methods without ! *
** many of the same as string **
<<  (concatenate)
[]= (indexed assignment)
clear (clears array)
concat (concatenate)
replace (swaps value of array for argument of the method, adding or removing elements as necessary to match proper length)
insert (injects element at given index, pushing all other elements back)

** specific to array **
delete (removes specified value)
delete_at(index) (removes value at specified index)
delete_if{|item| block} (removes values for which block evaluates to true)
reject{|item| block} (removes values for which block evaluates to true)
fill (replaces specified values with argument or according to block evaluation)
keep_if (deletes values that do not match the passed block evaluation)
pop / pop(n) (removes last element or last n number of elements from array)
push (adds element to end of array)
shift (removes first element from the array)
unshift (adds element as the first element in the array)

* array methods that end with ! and do not have non-mutating counterpart *
sort_by! https://ruby-doc.org/core-2.4.0/Array.html#method-i-sort_by-21
(sort in place by mapping values through a provided block)

* mutating hash methods without ! *
** share with string **
[]= (assignment, adds key-value pair to end of array or reassigns value of existing key)
clear (clears hash)
replace (replaces contents of hash with argument)

** share with array **
delete (deletes key-value pair)
delete_if{|item| block} (removes key-value pair for which block evaluates to true)
shift (removes first key-value pair)

** unique to hash **
rehash (rebuilds hash based on current values for each key)
store(key,value) (similar to []=, assigns key-value pairs to hash or reassigns current key value)
update(second_hash) (same as merge! - replaces values of existing keys with values from second_hash or creates new key-value pairs from second_hash) 

* hash methods that end with ! and do not have non-mutating counterpart *
none
