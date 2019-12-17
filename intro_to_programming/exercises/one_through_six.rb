# 1. Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

array.each { |num|
	puts num
}

# 2. Same as above, but only print out values greater than 5.

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

array.each { |num|
	if num > 5
		puts num
	end
}

=begin
	Could also use .select

bigger_than_five = array.select { |num|
	num > 5
}

puts bigger_than_five
=end

# 3. Now, using the same array from #2, use the select method to extract all odd numbers into a new array

bigger_than_five = array.select { |num|
	num > 5
}

odd = bigger_than_five.select { |int|
	int % 2 != 0
}

# 4. Append "11" to the end of the original array. Prepend "0" to the beginning.

array.unshift(0).push(11)

# 5. Get rid of "11". And append a "3".

array.pop
array.push(3)

# 6. Get rid of duplicates without specifically removing any one value.

array.uniq
