=begin
*assignment*
In this little assignment you are given a string of space separated numbers, and
have to return the highest and lowest number.

Notes:
All numbers are valid Int32, no need to validate them.
There will always be at least one number in the input string.
Output string must be two numbers separated by a single space, and highest
number is first.

*problem*
input: string of valid integers, at least 1 character long.
output: string of highest and lowest numbers from original string separated by
a single space. Highest always first.


*examples / test cases *
high_and_low("1 2 3 4 5")  # return "5 1"
high_and_low("1 2 -3 4 5") # return "5 -3"
high_and_low("1 9 3 4 -5") # return "9 -5"

*data structures*
string to array to string.

*algorithm*
BEGIN
  declare a method that accepts a single string as an argument
    split the string into an array of characters.
    sort the array lowest to highest  (is necessary?)
    PRINT "#{array.max} #{array.min}"
END


# these two only work with single digit numbers
def high_and_low(numbers)
  arr = numbers.split
  "#{arr.max} #{arr.min}"
end

def high_and_low(numbers)
  arr = numbers.split.sort!
  "#{arr[-1]} #{arr[0]}"
end
=end

=begin
def high_and_low(numbers)
  arr = numbers.split
  lowest = 1
  highest = 0
  arr.each do |digit|
    if digit.to_i < lowest || digit.to_i > highest
      if digit.to_i < lowest
        lowest = digit.to_i
      else
        highest = digit.to_i
      end
    end
  end
  "#{highest} #{lowest}"
end
=end

def high_and_low(numbers)
  arr = numbers.split.map { |str| str.to_i } #.sort
  # "#{arr[-1]} #{arr[0]}"
  "#{arr.max} #{arr.min}"
end

p high_and_low("1 2 3 4 5")  == "5 1"
p high_and_low("1 2 -3 4 5") == "5 -3"
p high_and_low("1 9 3 4 -5") == "9 -5"
p high_and_low("1") == "1 1"
p high_and_low("4 5 29 54 4 0 -214 542 -64 1 -3 6 -6") == "542 -214"
