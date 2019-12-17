# Tortoise Racing
# Two tortoises named A and B must run a race. A starts with an average speed of 720 feet per hour. Young B knows she runs faster than A, and furthermore has not finished her cabbage.
#
# When she starts, at last, she can see that A has a 70 feet lead but B travels 850 feet per hour. How long will it take B to catch A?
#
# More generally: given two speeds v1 (speed of A, integer > 0) and v2 (speed of B, integer > 0) and a lead g (integer > 0) how long will it take B to catch A?
#
# The result will be an array [hour, min, sec] which is the time needed in hours, minutes and seconds (round down to the nearest second) or a string in some languages.
#
# If v1 >= v2 then return nil.
#
# Examples:
# p race(720, 850, 70) == [0, 32, 18]
# p race(80, 91, 37)   == [3, 21, 49]
# https://www.codewars.com/kata/tortoise-racing
#
# in: integer (v1 - speed of tortoise A), integer (v2 - speed of tortoise B), integer (g - lead of tortoise A)
# out: array hours, minutes, seconds when A and B will be aligned.
#
# AL: distance where they cross & then calculate how many seconds that takes
# convert the seconds to hours, minutes, and seconds.
#
# 720 feet / hour : A
# 850 feet / hour : B
# # 70 foot lead for tortoise A
#
# 70 feet at 720 feet / hour
#
# we can calculate lead * SECONDS_PER_HOUR = v1 * x # solve for x => time elapsed since tortise A left.
#
MINUTES_PER_HOUR = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_HOUR = MINUTES_PER_HOUR * SECONDS_PER_MINUTE

def race(v1, v2, g)
  return nil if v1 >= v2
  time_passed = (g * SECONDS_PER_HOUR).fdiv(v1) # 350 seconds
#  minutes_passed = (g * MINUTES_PER_HOUR).fdiv(v1) # 5.83 minutes
  tortise_b_70 = (g * SECONDS_PER_HOUR).fdiv(v2) # 296.47 seconds
end

I know I need to solve for t in (v1 * t) + 70 / v2 = t but I'm not sure how to solve for the same variable on both sides of the equation. 


p race(720, 850, 70)# == [0, 32, 18]
# p race(80, 91, 37)   == [3, 21, 49]
