# 9. What's My Value? (Part 9)
# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a

# 7
# Because the block only sees the 'a' within its scope, it does not access or reassign the originally declared variable.
