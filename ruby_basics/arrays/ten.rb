# 10. Are We The Same?
=begin
In the code below, two arrays containing several numbers are assigned to two variables, array1 and array2.

array1 = [1, 5, 9]
array2 = [1, 9, 5]
Compare array1 and array2 and print true or false based on whether they match.
=end

# guess: false, arrays never match, but also these do not contain their elements in the same order.

array1 = [1, 5, 9]
array2 = [1, 9, 5]

puts array1 == array2

# could use include? to check if the contents were the same?
array2.each_with_index {|num, idx|
	puts array1.include?(array2[idx])
}
