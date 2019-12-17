# 2. Required Arguments
=begin
Assume you have this Array:

a = %w(a b c d e)
How would you use Array#insert to insert the numbers 5, 6, and 7 between the elements with values 'c' and 'd'?
=end

a = %w(a b c d e)
a.insert(3, 5, 6, 7)

The insert instance method first takes an index value for where to start inserting whatever objects follow it.
For this exercise, element 'd' has index 3. Since we want 5, 6, and 7 inserted before it, using the index of 3 will place 5 at that index and offset everything else accordingly. 
# https://ruby-doc.com/core-2.3.3/Array.html#method-i-insert
