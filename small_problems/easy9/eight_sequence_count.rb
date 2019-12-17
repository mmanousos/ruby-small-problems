=begin
*assignment*
Sequence Count
Create a method that takes two integers as arguments. The first argument is a
count, and the second is the first number of a sequence that your method will
create. The method should return an Array that contains the same number of
elements as the count argument, while the values of each element will be
multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater,
while the starting number can be any integer value. If the count is 0, an empty
list should be returned.

Examples:
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

*problem*
input: two integers, count and increment
output: an array of multiples of the increment integer, the length of count

start at increment and fill an array with count number of multiples

*examples / test cases *
see above

*data structures*
integers to array

*algorithm*
BEGIN
  declare a method that takes two integers as arguments
    SET arr = empty array to hold return values
    increment arg2 up to arg1 times pushing each value into arr
END
=end

def sequence(count, integer)
  arr = []
  counter = 1
  count.times do
    arr << integer * counter
    counter += 1
  end
  arr
end

def sequence(count, integer)
  arr = []
  while count > 0
    arr.unshift(integer * count)
    count -= 1
  end
  arr
end

# Course Solution - creating a range, then mapping the multiples into it 
def sequence(count, first)
  (1..count).map { |idx| idx * first }
end

p sequence(5, 1) #== [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
