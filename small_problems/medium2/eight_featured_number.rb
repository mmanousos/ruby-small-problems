=begin
*assignment*
Next Featured Number Higher than a Given Value
A featured number (something unique to this exercise) is an odd number that is a
multiple of 7, and whose digits occur exactly once each. So, for example, 49 is
a featured number, but 98 is not (it is not odd), 97 is not (it is not a
multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next
featured number that is greater than the argument. Issue an error message if
there is no next featured number.

Examples:
featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987
featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

*problem*
input: integer
output: next largest integer that is 1) odd, 2) a multiple of 7, & 3 does not
contain repeated digits


starting at provided integer, increment up to the next multipe of 7.
  - featured = get the modulo of integer % 7, subtract it from 7 & add the remainder to the integer
  - check that featured is odd and does not contain repeated digits
    - convert featured into string, break into array of characters, then iterate over characters, counting if any are >= 2
  if no, increment by multiples of 7 & check again.

*examples / test cases *
see above

*data structures*
integers

*algorithm*
BEGIN
  declare a method that takes a single integer as an argument
    SET feat_num = integer + ( 7 - ( integer % 7 ))

    IF feat_num.even? || feat_num.to_s.each_char.any? { |char| char.count(2) }
      increment feat_num += 7
      call method(feat_num) again to check next number
    ELSEIF feat_num.odd? && feat_num.to_s.each_char.none? { |char| char.count(2) }
      PRINT feat_num
    ELSE
      PRINT "There is no featured number for #{integer}."
END
=end

def featured(int)
  feat_num = int + ( 7 - ( int % 7 ))

  loop do
    break if feat_num >= 10_000_000_000
    num_digits = feat_num.digits
    if feat_num.odd? && num_digits.each.none? { |digit| num_digits.count(digit) >= 2 }
      puts "#{feat_num} is the featured number of #{int}."
      return feat_num
    elsif feat_num.even? || num_digits.each.any? { |digit| num_digits.count(digit) >= 2 }
      feat_num += 7
    end
  end

  "There is no possible number that meets the featured number requirements for #{int}."
end

# Course Solution
=begin
I appreciate that they started by finding the next largest odd number that is divisible by 7
And then looped (as I did) but added 14 to that number to avoid the need to check any even numbers.
Their logic to check for unique chars is much simpler than mine.
And I appreciate that they used the unique character requirement to determine the break point for the loop.
=end
def featured(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
