# 7. Keyword Arguments
=begin
What does this code print?

5.step(to: 10, by: 3) { |value| puts value }
=end

=begin
I started by looking in String Class, then in Integer (because the item being acted upon by the step method is an integer).
Then I looked in literals under numbers.
I searched step in the search bar and wound up in Class: Range
https://ruby-doc.org/core-2.2.0/Range.html#method-i-step
according to the solution, the proper documentation is in Class: Numeric
https://ruby-doc.org/core-2.3.0/Numeric.html (and that makes sense because it has the format of this exercise)
=end

# this expression is instructing the program to start with the number 5, then to count (step) to 10 using increments of 3.
# Along the way, it gets each increment and prints it to the screen. I thought it might use multiples of 3, but it literally just adds 3 to the base number.

=> 5
=> 8
