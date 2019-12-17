=begin
receive a list of words
sort them from a-z (without using .sort method) using recursion

check all the words in the array for the first one (using < )
move it to an array of sorted words
move all others to array of unsorted words
continue checking words in unsorted array until it is empty

book suggests using two methods (one as a wrapper method)
def sort some_array # to 'wrap' recursive_sort
  recursive_sort some_array, []
end

def recursive_sort unsorted_array, sorted_array
	# your code goes here
end

=end

sorted_words = []

def sort arr
	rec_sort arr, []
end

def rec_sort unsorted_words, sorted_words
	if unsorted_words.length <= 0
		return sorted_words
	end
	smallest = unsorted_words.pop
	still_unsorted = []
	unsorted_words.each do | tested_object|
		if tested_object < smallest
			still_unsorted.push smallest
			smallest = tested_object
		else
			still_unsorted.push tested_object
		end
	end
	sorted_words.push smallest
	rec_sort still_unsorted, sorted_words
end

def sort_recur
	unsorted_words = []
	puts 'please give me a list of words to sort, one per line'
	while true
		word = gets.chomp
		if word == ''
			return unsorted_words
		else
			unsorted_words.push word
		end
	end

end

sort unsorted_words

# puts(sort(['happy', 'puppy', 'can', 'can', 'bone']))
sort_recur


=begin
		def sort org_words
			org_words.each_with_index do |el, index|
				if index >= org_words.length
					sorted_words.push el
					org_words.delete_at(index)
				elsif el < el[index+1]
					index += 1
					sorting
				end
			end
		end
		puts 'Here are your sorted words: ' + sorted_words
	end
end
=end
