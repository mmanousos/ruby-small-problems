=begin
*assignment*
Even Numbers
Print the even numbers from 1 to 99, inclusive. All numbers should be printed on
separate lines.

*problem*
only print even numbers between 1-99
output: integers

*examples / test cases *

*data structures*

*algorithm*

=end

puts (1..99).to_a.keep_if { |num| num.even? }

# alternate using simple loop
num = 1
loop do
  break if num > 99
  puts num if num.even?
  num += 1
end
