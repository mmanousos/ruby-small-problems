Beer Song
Write a program that can generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.

in: one or more integer
out: verse -> string interpolating the integer and integer -1

If integer -1 == 0
 puts 'no more'

If integer == 0  
  puts 'no more'
  "go to the store and buy some more" reset count


create range using argument values
verse(99) == range (99..98)

use `#downto` method? => no, returns calling argument
set first argument as 'value'
accept second argument, set false as default in case it is not provided.
set second argument as 'bound'
  if it exists, use it, otherwise set it to value - 1

create empty array to hold verses

verse =
"#{value} bottles of beer on the wall, #{value} bottles of beer.\n Take one down and pass it around, #{value -1} bottles of beer on the wall.\n"
push verse to array
de-increment value by 1

break if value == bound (while value > bound)

return array elements, joined with ("\n")  

Bonus Point!
After you've come up with a solution that can pass the tests, try a bonus solution with the restriction that there can't be any conditionals (if or case statements) in your code.

Hint: do some research on the topic of "replacing conditionals with polymorphism".
