=begin
*assignment*
After Midnight (Part 2)
As seen in the previous exercise, the time of day can be represented as the
number of minutes before or after midnight. If the number of minutes is
positive, the time is after midnight. If the number of minutes is negative, the
time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the
number of minutes before and after midnight, respectively. Both methods should
return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

Examples:
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

Disregard Daylight Savings and Standard Time and other irregularities.

*problem*
two methods!
input: string representing a time in 24 hour format, two digits for the hour and
two digits for the minutes
output: integer representing number of minutes before / after midnight

if hour == 00 or 24 and minutes == 00
  integer = 0

calculate to convert to minutes = (hour * 60) + minutes

for after_midnight
return converted minutes

for before_midnight
subtract converted minutes from hours_per_day * minutes_per_hour

*examples / test cases *
see above

*data structures*
string to integer

*algorithm*
BEGIN
  declare after_midnight method that takes one string (time) as an argument
    SET hour = zero and first index values of string, converted to integer
    SET minute = third and fourth index values of string, converted to integer
    IF hour == 24
      hour = 0
    PRINT hour * 60 + minute #minutes after midnight
END

BEGIN
  declare before_midnight method that takes one string (time) as an argument
    SET minutes_per_day = 24 * 60 #hours per day * minutes per hour
    SET hour = zero and first index values of string, converted to integer
    SET minute = third and fourth index values of string, converted to integer
    IF hour == 24
      hour = 0
    PRINT minutes_per_day - ((hour * 60) + minute) #minutes before midnight
END
=end

def after_midnight(time)
  hour = time[0] + time[1]
  minute = time[3] + time[4]
  hour = 0 if hour.to_i == 24
  hour.to_i * 60 + minute.to_i
end

def before_midnight(time)
  minutes_per_day = 24 * 60
  hour = time[0] + time[1]
  minute = time[3] + time[4]
  hour = 0 if hour.to_i == 24
  if hour.to_i == 0 && minute.to_i == 0
    0
  else
    minutes_per_day - (hour.to_i * 60 + minute.to_i)
  end
end

# Course solution
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i) # (&:to_i) equivalent to { |string| string.to_i }
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time)
  minutes_remaining = MINUTES_PER_DAY - after_midnight(time)
  minutes_remaining = 0 if minutes_remaining == MINUTES_PER_DAY
  minutes_remaining
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
p after_midnight('00:02') == 2
p before_midnight('00:02') == 1438
