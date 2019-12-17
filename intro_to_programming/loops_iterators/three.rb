# Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.

my_array = [5, 17, "house", true, "what have you", 42, 'wherefore']

my_array.each_with_index { |el, index|
		puts "index #{index}: #{el}"
}
