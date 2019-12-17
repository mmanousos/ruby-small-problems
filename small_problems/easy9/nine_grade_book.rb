=begin
*assignment*
Grade book
Write a method that determines the mean (average) of the three scores passed to
it, and returns the letter value associated with that grade.

Numerical Score Letter	Grade
90 <= score <= 100	     'A'
80 <= score < 90	       'B'
70 <= score < 80	       'C'
60 <= score < 70	       'D'
0 <= score < 60	         'F'

Tested values are all between 0 and 100. There is no need to check for negative
values or values greater than 100.

Examples:
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

*problem*
input: three integers
output: letter representing the average of the three integers

average = add all three values then divided by 3.
check average against ranges using case statement

*examples / test cases *
see above

*data structures*
integers to string

*algorithm*
BEGIN
  declare a method that takes three integers as arguments
    SET avg = (arg1 + arg2 + arg3) / 3
    case avg
    when 90..100
      then 'A'
    when 80...90
      then 'B'
    when 70...80
      then 'C'
    when 60...70
      then 'D'
    else
           'F'
END
=end

def get_grade(score1, score2, score3)
  avg = (score1 + score2 + score3) / 3
  case avg
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else              'F'
  end
end

# Further exploration
# How would you handle this if there was a possibility of extra credit grades
# causing it to exceed 100 points?

# can break out 'A' conditions into their own if statement and leave the rest of
# the conditions from the case in the else conditional
def get_grade(score1, score2, score3)
  avg = (score1 + score2 + score3) / 3
  if avg >= 90
    'A'
  else
    case avg
    when 80...90 then 'B'
    when 70...80 then 'C'
    when 60...70 then 'D'
    else              'F'
    end
  end
end

p get_grade(95, 90, 93) == 'A'
p get_grade(50, 50, 95) == 'D'
p get_grade(70, 70, 70) == 'C'
