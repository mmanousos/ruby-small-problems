Create a clock that is independent of date.

You should be able to add and subtract minutes to it. Two clocks that represent the same time should be equal to each other.


Problem
A class that creates clock objects.
Objects should have add and subtract methods as well as an equivalency method.

Example / Tests
see test suite

Data Structure
string

Algorithm
BEGIN

  define `at` method - creates new clock
  first argument is hours, second (optional) argument is minutes

  define `to_s` - returns string-formatted time as 'hour:minutes'
  format('%02d:%02d', hours, minutes)

  define `+` method - to add argument number of minutes
    succ?

  define `-` method - to subtract argument number of minutes

  define `==(other_clock)` method - to compare two clock objects
  self.clock = other_clock

END
