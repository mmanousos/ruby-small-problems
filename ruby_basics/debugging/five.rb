# 5. Even Numbers
=begin
We want to iterate through the numbers array and return a new array containing only the even numbers. However, our code isn't producing the expected output. Why not? How can we change it to produce the expected result?

numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.map do |n|
  n if n.even?
end

p even_numbers # expected output: [2, 6, 8]
=end

# #map should be used to cycle over all the values and alter them in the same way. Instead #select should be used here.

numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.select do |n|
  n.even? # using #.even? is already evaluating for true/false so "if" is unnecessary
end

p even_numbers
