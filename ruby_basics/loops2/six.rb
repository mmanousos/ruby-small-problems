# 6. Empty the Array
# Given the array below, use loop to remove and print each name. Stop the loop once names doesn't contain any more elements.

names = ['Sally', 'Joe', 'Lisa', 'Henry']
# Keep in mind to only use loop, not while, until, etc.

# print first to last
loop {
	if names.size > 0
		name = names.shift
		puts name
	else
		break # without this break, the program does not exit after the final name is printed.
	end
}

# print last to first
loop {
	if names.size > 0
		puts names.pop # pulls from end of array first
	  break if names.empty?
	end
}


# .empty? is another new method to me.
