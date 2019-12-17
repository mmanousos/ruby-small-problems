=begin
*assignment*
Leap Years (Part 1)
In the modern era under the Gregorian Calendar, leap years occur in every year
that is evenly divisible by 4, unless the year is also divisible by 100. If the
year is evenly divisible by 100, then it is not a leap year unless the year is
evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method that
takes any year greater than 0 as input, and returns true if the year is a leap
year, or false if it is not a leap year.

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true

*problem*
input: year as non-zero positive integer
output: boolean

check:
if integer is divisible by 400 without remainder => true
if integer is divisible by 100 without remainder => false
if integer is divisible by 4 without remainder => true
else => false

*examples / test cases *
see above

*data structures*
integers

*algorithm*
START
  declare method that accepts one integer as argument
    IF int % 400 == 0
      true
    ELSEIF int % 100 == 0
      false
    ELSEIF int % 4 == 0
      true
    ELSE
      false
    end
END
=end

def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  elsif year % 4 == 0
    true
  else
    false
  end
end

# implicit boolean logic
def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

# condensed logic
def leap_year?(year)
  ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0))
end

# Further Exploration
=begin
The order in which you perform tests for a leap year calculation is important.
For what years will leap_year? fail if you rewrite it as:

def leap_year?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end
=end
# => incorrectly fails on 2400, 240000, 2000, 400

=begin
Can you rewrite leap_year? to perform its tests in the opposite order of the
above solution? That is, test whether the year is divisible by 4 first, then, if
necessary, test whether it is divisible by 100, and finally, if necessary, test
whether it is divisible by 400. Is this solution simpler or more complex than
the original solution?
=end

def leap_year?(year)
  (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
end

# In this configuration, it's not more complex than the original.
# But this version requires checking both divisibility by 4 and 100.

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
