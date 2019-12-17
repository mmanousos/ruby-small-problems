Meetup
Typically meetups happen on the same day of the week.

Examples are

the first Monday
the third Tuesday
the Wednesteenth
the last Thursday

Note that "Monteenth", "Tuesteenth", etc are all made up words. There was a meetup whose members realized that there are exactly 7 days that end in '-teenth'. Therefore, one is guaranteed that each day of the week (Monday, Tuesday, ...) will have exactly one date that is named with '-teenth' in every month.

Write code that calculates date of meetups.

Problem
meetups happen on specific days of a month -
first
second
third
fourth
last
or made up day "teenth" (if it's on a date that ends in "teenth" - eg fifteenth of March - if date is 2 digits, first digit is 1 and second digit is not 1 or 2)

given a month and a year, we should be able to determine the day of the week it occurs on, and if it is "teenth" or not.
if "teenth" it supersedes any other designation of day of the month

Example / Tests


Data Structure


Algorithm
BEGIN
instantiate a new object of the Date class for the correct month of the given year

day:
iterate over the days of the date object to select the ones that are of the correct weekdays
  e.g. if the symbol is `:monday`
    starting at 1, check if it is a monday?
then iterate over this newly created array and check which matches the correct schedule.     

END
