=begin
*Assignment*
How Many?
Write a method that counts the number of occurrences of each element in a given array.

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)

Once counted, print each element alongside the number of occurrences.

Expected output:
	car => 4
	truck => 3
	SUV => 1
	motorcycle => 2

*Problem*
	Input: array of elements (this instance is strings)
	Output: element name with number of occurrences as integer
	Receive array, examine each element of the array: unique elements are assigned as keys, duplicate elements increase count value of key.

*Examples / Test Cases*
see above

*Data Structure*
	input: array
	output: hash

*Algorithm*
	Create empty hash.
	Loop through array examining each element of the array against the hash.
		if the element does not already exist, create it as a key and assign its value as 1
		if it does exist, increase the value +1
		print the hash

=end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(array)
	hash = {}
	array.each {|el|
		if hash[el] == nil
			hash[el] = 1
		else
			hash[el] = hash[el] + 1
		end
	}
	hash.each { |key, value|
		puts "#{key} => #{value}"
	}
end

count_occurrences(vehicles)

=begin *course solution - uses array method #count
def count_occurrences(array)
	occurrences = {}

	array.each do |element|
		occurrences[element] = array.count(element) # counts the number of times the element appears in the array
	end

	occurrences.each do |element, count|
		puts "#{element} => #{count}"
	end
end
=end
