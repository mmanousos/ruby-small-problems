=begin
*assignment*
Counting Up
Write a method that takes an integer argument, and returns an Array of all
integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater
than 0.

Examples:
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

*problem*
input: integer
output: array of integers from 1 to the provided integer

*examples / test cases *
see above

*data structures*
integer and array

*algorithm*
BEGIN
  declare a method that takes one integer as an argument
    SET arr = empty array to hold return values
    SET counter = 1
    WHILE counter <= integer
      push counter to arr
    PRINT arr
END
=end 

def sequence(int)
  arr = []
  1.upto(int) { |num| arr << num }
  arr
end

# Course Solution - creates a range including one and the number then converts
# it to an array
def sequence(number)
  (1..number).to_a
end

# Further Exploration
=begin
Food for thought: what do you think sequence should return if the argument is
not greater than 0. For instance, what should you do if the argument is -1?
Can you alter your method to handle this case?
=end

# There are options here: should the array count from the integer up to 1 or
# should it count down to the provided integer? Since the problem is called
# 'Counting Up', my solution(s) will count from the integer to 1.

def sequence(int)
  arr = []
  int < 0 ? int.upto(1) { |num| arr << num } : 1.upto(int) { |num| arr << num }
  arr
end

def sequence(number)
  number < 0 ? (number..1).to_a : (1..number).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-1) == [-1, 0, 1]
