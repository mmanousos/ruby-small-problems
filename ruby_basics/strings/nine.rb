# 9. Pluralize
=begin Given the following code, use Array#each to print the plural of each word in words.

words = 'car human elephant airplane'
Expected output:

	cars
	humans
	elephants
	airplanes
=end

words = 'car human elephant airplane'
arr = words.split
arr.each do |word|
	puts word + "s"
end

# use #split method with the space delimiter to create an array with each word from the string as an array element.
# use the #each method to cycle through all the words and print them with an added 's'

 # could make it even shorter by combining both methods because split returns an array, so the array method can be invoked immediately without assigning to its own variable.
=begin
words.split.each do |word|
	puts word + "s"
end
=end
