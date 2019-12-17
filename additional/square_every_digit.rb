=begin
*assignment*
Welcome. In this kata, you are asked to square every digit of a number.

For example, if we run 9119 through the function, 811181 will come out, because
92 is 81 and 12 is 1.

Note: The function accepts an integer and returns an integer

*problem*
input: integer
output: integer that represents a square of each digit of the original integer

*the squares are concatenated, not added.


*examples / test cases *
square_digits(9119) == 811181

*data structures*


*algorithm*
BEGIN
  declare a method that accepts one integer (num) as an argument
    split num into an array of digits (and reverse the digits into original order)
    map each digit to its square
    rejoin the squares into a single string, convert to integer and return.
END
=end

def square_digits(num)
  num.digits.reverse.map { |dig| dig ** 2 }.join.to_i 
end

p square_digits(3212) == 9414
p square_digits(2112) == 4114
p square_digits(1111) == 1111
p square_digits(1234321) == 14916941
p square_digits(0) == 0
