# 6. Multiple Signatures
=begin
What do each of these puts statements output?

a = %w(a b c d e)
puts a.fetch(7) # 1
puts a.fetch(7, 'beats me') # 2
puts a.fetch(7) { |index| index**2 } # 3
=end

1. IndexError # returns an error because the specified index is outside of the array
	"IndexError: index 7 outside of array bounds: -5...5"
2. 'beats me' # returns the "default" second argument
3. 49 # squares the provided index number, not any value from within the array

=begin
First I had to recognize that the syntax 'a = %(a b c d e)' was referring to an array. (I have only encountered that format in the documentation and these exercises.)
Then I had to look up the 'fetch' method in the Array class.
https://ruby-doc.com/core-2.3.3/Array.html#method-i-fetch
=end
