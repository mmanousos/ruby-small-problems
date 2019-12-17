=begin
*assignment*
Odd Numbers
Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

*problem*
print numbers including 1 & 99 on separate lines, only if they are odd.
output: integers

*examples / test cases *

*data structures*

*algorithm*
use #each method on the range 1 - 99.
=end

range = 1..99
range.each do |num|
  puts num if num.odd?
end

# Further Exploration

1.upto(99) do |num|
  (num % 2 != 0) ? (puts num) : next
end

1.upto(99) do |num|
  puts num if num % 2 != 0
end

puts (1..99).to_a.select { |el| el.odd? }

puts (1..99).to_a.keep_if { |el| el.odd? }
