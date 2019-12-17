=begin
*assignment*
After Midnight (Part 1)
The time of day can be represented as the number of minutes before or after
midnight. If the number of minutes is positive, the time is after midnight.
If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the
time of day in 24 hour format (hh:mm). Your method should work with any integer
input.

You may not use ruby's Date and Time classes.

Examples:
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

Disregard Daylight Savings and Standard Time and other complications.

*problem*
input: integer representing number of minutes before or after midnight
output: string representing the time in 24 hour display (hours:minutes)

midnight is represented as "00:00"
negative integers imply time should be counted backward from midnight
positive integers indicate counting forward from midnight

constants:
hours = 24
min_per_hr = 60
number of minutes in a day = 1440

add or subtract as appropriate
convert to the correct time by dividing by hours, remainder is minutes
join them into a string using a colon as the delimiter

*examples / test cases *
see above

*data structures*
integer to string

*algorithm*
START
  SET minutes per hr = 60
  SET minutes per day = 1440
  declare a method that accepts a single integer as an argument
    if integer != 0
      time = minutes per day + integer
    else
      time = 0
    end

    hours = time / minutes per hour
    minutes = time % minutes per hour
    "#{hours}:#{minutes}"
END
=end

HR_PER_DAY = 24
MIN_PER_HR = 60
MIN_PER_DAY = 1440

def time_of_day(int)
  time = int != 0 ? MIN_PER_DAY + int : 0

  hrs = time / MIN_PER_HR
  mins = time % MIN_PER_HR

  if hrs.abs >= HR_PER_DAY
    days = hrs / HR_PER_DAY
    hrs -= days * HR_PER_DAY
  end

  hrs = "0#{hrs}" if hrs < 10

  mins = "0#{mins}" if mins < 10

  "#{hrs}:#{mins}"
end

# course solution
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes = delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end
# I've never seen the modulo operator used in this way - essentially to return
# how far from the second value the first value is.
# Looking at it further, I do understand, but I would not have thought to use it
# in this way.

# using #divmod to break the remainder into hours and minutes is quite slick and
# essentially combines my two lines of code into one

# using the Kernel#printf (format) saves an additional 2 lines

p time_of_day(0) # == '00:00'
p time_of_day(-3) # == '23:57'
p time_of_day(35) # == '00:35'
p time_of_day(-1437) # == '00:03'
p time_of_day(3000) # == '02:00'
p time_of_day(800) # == '13:20'
p time_of_day(-4231) # == '01:29'
