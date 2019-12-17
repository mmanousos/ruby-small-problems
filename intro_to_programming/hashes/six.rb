=begin
Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order.
Your output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]
["diet", "edit"]
["tied", "tide"]
["evil", "live", "veil", "vile"]
["fowl", "flow"]

=end

=begin my solution using arrays only **PSEUDOCODE**
 cycle through each word in the array.
 check if the other words have the same letters (break each into an array, use sort method on each, then compare: if ==, push new word to array)
 remove all words that match from original array
=end


words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

sorted_words = []

while words.length > 0
	curr_word = words.first # access the first word in the array
  cut_word = curr_word.split('').sort # split first word into letters in its own array & sort them

	arr = words.select { |el| # pull a selection of words from the array that meet the critera
		addl_word = el.split('').sort # split each word in the array in sequence
		cut_word == addl_word # compare that word to the first word
	}
	sorted_words.push(arr) # add new array of annagrams to 'sorted_words'
	# remove all words in 'arr' from 'words'
	arr.each { |item|
		words.delete(item)
	}
end

# Original output commands: Do not return words in their separate arrays as in the example.
 # puts sorted_words # Returns them individually in their groups.
 # p sorted_words # Returns the entire nested (2D) array

# Better solution (to match example)
sorted_words.each_index { |index|
	p sorted_words[index]
}

=begin
# solution using hash (per answer key)

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

answer = {} # create an empty hash

words.each { |word|  # for each word in the given array
	key = word.split('').sort.join  # sort the letters in the word and assign that as a (potential) key in the new hash
	if answer.has_key?(key) # if the array already has a key with that name
		answer[key].push(word) # push the word into the array associated as the value of that key
	else	# otherwise
		answer[key] = [word] # assign that word to it's own array.
	end
}

# return each array from the new hash
answer.each_value { |item|
	p item
}
=end
