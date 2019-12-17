=begin
*assignment*
What Century is That?
Write a method that takes a year as input and returns the century. The return
value should be a string that begins with the century number, and ends with st,
nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise
the 20th century.

Examples:
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

*problem*
input: non-zero integer
output: string ending in 'st', 'nd', 'rd', or 'th' as appropriate

special cases: 11th, 12th, 13th
standard format: 1st, 2nd, 3rd, 4-9th
0 - 99 = 1st

divide integer by 100
if no remainder,
  split into digits
  count the length

get remainder if / 100
if no remainder
  split integer into digits and reverse
  get length of array
  if < 3 == 1st
  if < 4
      get last two element of array == year
      get first element of array == century
      if year > 00
      century to print = century + 1

  if > 1; get remainder if / 10
  check last digit and append appropriate ending


*examples / test cases *
see above

*data structures*
integer to string

*algorithm*
START
  declare method that takes one integer as argument
  split integer into digits and reverse
    SET count digits
    IF digit count < 3 PRINT "1st"
    ELSE
      SET year = last two elements of the array (start pulling from end of the
      array -1, -2)
      SET century = remainder of the array
    end

      IF year != 0
        century to print = century + 1

      IF century ends in 1 += 'st'
      ELSEFIF ends in 2 += 'nd'
      ELSEIF ends in 3 += 'rd'
      ELSEIF ends in 11 += 'th'
      ELSEIF ends in 12 += 'th'
      ELSEIF ends in 13 += 'th'
      ELSE ends in 4-0 += 'th'

    PRINT join century to string + append appropriate ending
END
=end

def century(int)
  numbers = int.digits.reverse!
  year = []
  century_to_print = []

  if numbers.count < 3
    return '1st'
  else
    year << numbers.pop
    year.unshift(numbers.pop)
    century_to_print = numbers
  end

  if year[1] > 0
    if century_to_print[-1] == 9
      century_to_print[-2] += 1
      century_to_print[-1] = 0
    else
      century_to_print[-1] += 1
    end
  end

  end_of_century = (century_to_print[-2].to_s + century_to_print[-1].to_s).to_i
  if (11..13).include?(end_of_century)
    return century_to_print.join.to_s + 'th'
  end

  case century_to_print[-1]
  when 1
    append = 'st'
  when 2
    append = 'nd'
  when 3
    append = 'rd'
  else
    append = 'th'
  end

  return century_to_print.join.to_s + append

end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

=begin 
def century(year)
  unless year % 100 == 0
    century = year / 100 + 1
  else
    century = year / 100
  end

  century_to_array = century.digits.reverse
  century_end = (century_to_array[-2].to_s + century_to_array[-1].to_s).to_i
  if (11..13).include?(century_end)
    return century.to_s + 'th'
  end

  case century.digits.reverse[-1]
  when 1
    return century.to_s + 'st'
  when 2
    return century.to_s + 'nd'
  when 3
    return century.to_s + 'rd'
  else
    return century.to_s + 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

=begin
The course solution is much easier to read.
Using modulo to get the last digits of the century is infinitely cleaner than
spliting it into an array and accessing each value.
Also, using two methods makes sense because otherwise the method is too complex
and output is a bit convoluted.
=end
