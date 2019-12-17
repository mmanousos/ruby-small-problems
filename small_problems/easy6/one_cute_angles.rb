=begin
*assignment*
Cute angles
Write a method that takes a floating point number that represents an angle
between 0 and 360 degrees and returns a String that represents that angle in
degrees, minutes and seconds. You should use a degree symbol (°) to represent
degrees, a single quote (') to represent minutes, and a double quote (") to
represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Examples:
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

Note: your results may differ slightly depending on how you round values, but
should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes
and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:
DEGREE = "\xC2\xB0"

*problem*
input: float
output: string with three components divided by the degree symbol and single
quote and closed with a double quote

Calculation for converting minutes and seconds to float degrees:
40 + (20 * 1/60) + (50 * 1/60 * 1/60)

Converse: multiply the float (value after the decimal point) by 60.
Any whole integer = minutes
float of that product should again be multiplied by 60 and = seconds

if value is an integer
  if it is 0 or 360
    set integer value to 0
  set the degrees to the integer value + DEGREE
  minutes = 00'
  seconds = 00"
else
  set degrees to the integer value (break the value at the decimal using divmod)
  multiply float by 60
  get the integer there and set it to the minutes
  multiply float by 60
  round that value if necessary and set it to the seconds

*examples / test cases *
see above

*data structures*
float to string
*algorithm*

=end

DEGREE = "\xC2\xB0"

# a working solution - seems redundant
def dms(float)
  degrees, decimal = float.divmod(1)
  minutes, remain = (decimal * 60).divmod(1)
  seconds = (remain * 60).round
  if minutes == 60
    degrees += 1
    minutes = 0
  end
  if seconds == 60
    minutes += 1
    seconds = 0
  end
  %(#{degrees}#{DEGREE}) + format(%(%02d'%02d"), minutes, seconds)
end

# another working solution - still seems redundant
def dms(float)
  array = float.divmod(1)
  degrees = array.shift
  array = (array[0] * 60).divmod(1)
  minutes = array.shift
  seconds = (array[0] * 60).round
  if minutes == 60
    degrees += 1
    minutes = 0
  end
  if seconds == 60
    minutes += 1
    seconds = 0
  end
  %(#{degrees}#{DEGREE}) + format(%(%02d'%02d"), minutes, seconds)
end

# another solution - still seems redundant even with loops
def dms(float)
  arr = float.divmod(1)
  temp_arr = []
  dms_arr = []
  while temp_arr.size <= 2
    if arr[0] < 1
      arr = (arr[0] * 60).divmod(1)
    end
    temp_arr << arr[0]
    arr.delete_at(0)
  end

  while temp_arr.size > 0
    if temp_arr[1] == 59
      temp_arr[0] += 1
      temp_arr[1] = 0
    end
    dms_arr << temp_arr[0]
    temp_arr.delete_at(0)
  end
end

# Better but still not great
def dms(float)
  arr = float.divmod(1)
  dms_arr = []
  while dms_arr.size <= 2

    if arr[0] < 1
      arr = (arr[0] * 60).divmod(1)
      if arr[0] == 59 && dms_arr.last != nil
        dms_arr[-1] += 1
        arr[0] = 0
      end
    end

    dms_arr << arr[0]
    arr.delete_at(0)
  end

%(#{dms_arr[0]}#{DEGREE}) + format(%(%02d'%02d"), dms_arr[1], dms_arr[2])
end

# Course Solution
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

# Further Exploration
=begin
Our solution works with any non-negative number of degrees, including values
outside the range 0 to 360. Does yours?

# Yes, mine functions properly with the entire range of non-negative numbers but
# fails with negative numbers.

While our solution works with the expanded range of non-negative numbers, it
fails with negative numbers. For instance, dms(-76.73) returns -77°16'12", which
is incorrect. Update our solution so that it works with negative values as well
as non-negative values.
=end

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  if degrees_float < 0
    total_seconds = (degrees_float * SECONDS_PER_DEGREE)
    degrees, remaining_seconds = total_seconds.divmod(-SECONDS_PER_DEGREE)
    minutes, seconds = remaining_seconds.divmod(-SECONDS_PER_MINUTE)
    degrees = -degrees
    seconds = seconds.abs
  else
    total_seconds = (degrees_float * SECONDS_PER_DEGREE)
    degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
    binding.pry
    minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
    binding.pry
  end
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

=begin
When divmod is used to parse a negative number by a positive number, the
negative value is assigned to the integer and the remainder is positive. If a
negative number is divided by a negative number, the integer is positive and the
remainder is assigned negative.
In this case, when the negative total_seconds was parsed by SECONDS_PER_DEGREE,
the value was also rounded down (to -77) and the remaining_seconds were returned
as a positive float with a much lower absolute value than they should have
(972.0 vs -2628.0). But flipping SECONDS_PER_DEGREE to negative corrects for
this, and then the negative indicator needs to be added back to the degrees
value before it is returned. Similarly, remaining_seconds needs to be divided by
negative SECONDS_PER_MINUTE (to prevent additional improper calculations).
The seconds value is returned as negative so that needs to be converted to
positive before it is returned.
What is more important is the rounding of negative numbers. I will need to be
hyper aware of that in the future.
=end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") # || dms(360) == %(0°00'00")
p dms(570.75)
p dms(-76.73) == %(-76°43'48")
