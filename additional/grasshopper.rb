=begin
*assignment*
Summation
Write a program that finds the summation of every number between 1 and num. The
number will always be a positive integer greater than 0.

*problem*
input: integer
output: integer that is the sum of all integers between 1 and the number,
inclusive

Since the number (arg) will always be positive, can use #upto method!

*examples / test cases *
summation(2) -> 3
1 + 2

summation(8) -> 36
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8

*data structures*


*algorithm*
BEGIN
  declare a method that takes an integer (num) as an argument
    SET total = 0
    call the looping method on 1 passing num as the argument
    use the block to add each iterative number to total.
    PRINT total
END
=end
=begin
def summation(num)
  total = 0
  1.upto(num) { |n| total += n }
  total
end
=end

def summation(num)
  total = [*1..num].sum  
end

p summation(2) == 3
p summation(8) == 36
