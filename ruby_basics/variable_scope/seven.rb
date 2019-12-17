# 7. What's My Value? (Part 7)
# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

=begin
prints:
3

Blocks have more flexible scope so the variable 'a' is accessible.
'a' is assigned to the elements of the array in order.
Only the final evaluated element is returned and printed because the 'puts' call is outside of the block.
(If within, it would have printed all three elements of the array).
=end
