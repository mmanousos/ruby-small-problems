# Next Featured Number Higher than a Given Value
# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.

# in: integer
# out: next "featured integer" or error message

# featured integers:
#   odd number
#   divisible by 7
#   no duplicate digits

# AL: iterate through mutiples of 7 until finding one that is both odd and > integer argument.

#   return that number if all digits are unique
#   (break number into digits & use any? to check for == )

#   otherwise, increment by 14 to get to next odd multiple of 7.

# first solution
def featured(int)
  num = 0

  loop do
    break if num.odd? && num > int
    num += 7
  end

  loop do
    break if num.digits.size > 9
    if num.digits.uniq == num.digits
      return num
    else
      num += 14

    end
  end

  return "There are no featured numbers for this integer."
end

# second solution - finds the starting # faster, eliminating the need to loop through multiples of 7.
def featured(int)

  div, mod = int.divmod(7)
  adjust = 7 - mod
  num = int + adjust

  loop do
    break if num.digits.size > 10

    if num.odd? && num > int
      loop do
        if num.digits.uniq == num.digits
          return num
        else
          num += 14
        end
      end
    else
      num += 7
    end

  end

  return "There are no featured numbers for this integer."
end

# third solution - two separate loops. One to find the odd multiple of 7, one to find the one with unique digits
# borrows better break condition from Course Solution
def featured(int)

  div, mod = int.divmod(7)
  adjust = 7 - mod
  num = int + adjust

  until num.odd?
    num += 7
  end

  loop do
    return num unless num.digits.uniq != num.digits
    num += 14
    break if num >= 9_876_543_210
  end

  "There are no featured numbers for this integer."
end


p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
