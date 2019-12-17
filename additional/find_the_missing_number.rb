=begin
*assignment*
Find the Missed Number

Documentation:
find_number(start, stop, string)
start => from
stop => to
string => numbers from start to stop in string form (shuffled), but missing one number


*problem*
input: integer representing start number, integer representing stop number,
string of shuffled integers from start to stop
output: array of missed integer(s) from the string.


*examples / test cases *
str = "2198765123416171890101112131415"
find_number(1, 21, str)
  # => [ 12, 21 ]

str = "578910"
find_number(5, 10, str)
  # => [ 6 ]

*data structures*
string, array

*algorithm*
BEGIN
  declare a method that accepts two integers (start, stop) and one string as arguments
    SET missing = [] empty array to hold missing values
    SET str_nums = str.chars.sort
    start.upto(stop) do |num|
      num_str = num.to_s
      IF str_nums.include?(num_str) # if the given number exists in the array
        str_nums.sub(num_str, '') # remove it
      ELSEIF num_str.size > 1
        num_str_chars = num_str.chars
        num_str_chars.all? { |char|  }


        if every character of num_str_chars exists in str_nums
          remove one of each character.
      ELSE
        missing << num
      end
    end
    missing
END
=end
require 'pry'
def find_number(start, stop, string)
  missing = []
  start.upto(stop) do |num|
    num_str = num.to_s
    if string.include?(num_str)
      string.sub(num_str, '')
    elsif num_str.size > 1
      num_str_chars = num_str.chars
      if num_str_chars.all? { |char| string.include?(char) }
        num_str_chars.each do |char|
          string.sub(char, '')
        end
      end
    else
      missing << num
    end
  end
  missing
end

str = "578910"
p find_number(5, 10, str) == [ 6 ]

# str = "2198765123416171890101112131415"
# p find_number(1, 21, str) # == [ 12, 21 ]
