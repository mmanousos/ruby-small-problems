=begin
*assignment*
Multiples of 3 and 5
Write a method that searches for all multiples of 3 or 5 that lie between 1 and
some other number, and then computes the sum of those multiples. For instance,
if the supplied number is 20,
the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

Examples
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

*problem*
input: integer
output: integer that is the sum of all multiples of 3 and 5 between 1 - integer,
including the provided integer.
Assume integer is larger than 1.

loop through range of numbers between 1 - number,
add any that are multiple of 3 or 5
return sum

*examples / test cases *
see above

*data structures*
integers

*algorithm*
START
  declare method that takes one number as an argument
    counter = 1
    sum = 0
    WHILE counter <= number
      IF counter % 3 == 0 or counter % 5 == 0
        sum += counter
      end

      counter += 1
    end
    sum
  end
END
=end

# simple loop
def multisum(int)
  counter = 1
  sum = 0

  while counter <= int

    if counter % 3 == 0 or counter % 5 == 0
      sum += counter
    end

    counter += 1
  end

  sum
end

# using #select to get the correct values and #sum to total them
def multisum(int)
  (1..int).to_a.select { |num| num % 3 == 0 || num % 5 == 0 }.sum
end

# Further Exploration
=begin
Investigate Enumerable.inject (also known as Enumerable.reduce), How might this
method be useful in solving this problem? (Note that Enumerable methods are
available when working with Arrays.) Try writing such a solution. Which is
clearer? Which is more succinct?
=end

# using #keep_if and #inject to total the values in the array
def multisum(int)
  (1..int).to_a.keep_if { |num| num % 3 == 0 || num % 5 == 0 }.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
