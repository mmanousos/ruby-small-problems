Meetup
Typically meetups happen on the same day of the week.

Examples are

the first Monday
the third Tuesday
the Wednesteenth
the last Thursday

Note that "Monteenth", "Tuesteenth", etc are all made up words. There was a meetup whose members realized that there are exactly 7 days that end in '-teenth'. Therefore, one is guaranteed that each day of the week (Monday, Tuesday, ...) will have exactly one date that is named with '-teenth' in every month.

Write code that calculates date of meetups.


options for day of the month are:
first
second
third
fourth
last
teenth

teenth supersedes any other designation
"teenth" = day of the month starts with 1 and is followed by a number > 2


class needed:
Meetup

methods needed:
'new' (arguments are year and month)
'day' (arguments are symbols for day of week and day of month as above)


create new Date object using year and month.
use first argument of `day` method to find the first instance of that day of the week in the month
  iterate through day of week to find which day of the week that date is.
  IF index of argument is > current day (2 for Wednesday > 0 for Monday)
    to date day: add difference  
  ELSE if index of argument is < current day (0 for Monday < 2 for Wednesday)
  to date day: add 7, subtract index of current day  
Create array of values of that day of the week within the month
  -> from the first instance, iterate through the month
    -> while Date.month = @month meetup_date += 7
use second argument of `day` method to select correct date from array
  if day is "teenth"
    check meetup_date.day < 20 && > 12

Went the very long way to get to a working solution!
