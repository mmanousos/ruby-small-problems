# 7. Low, Medium, or High?
=begin
Use Hash#select to iterate over numbers and return a hash containing only key-value pairs where the value is less than 25. Assign the returned hash to a variable named low_numbers and print its value using #p.

numbers = {
  high:   100,
  medium: 50,
  low:    10
}
Expected output:

	{low: 10}
=end

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

p low_numbers = numbers.select { |key, val|
	val < 25
}
