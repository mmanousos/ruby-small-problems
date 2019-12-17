# 8. What's My Value? (Part 8)
# What will the following code print, and why? Don't run the code until you have tried to answer.

array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

# NameError 
# Because 'a' is not defined ahead of time, it only exists within the scope of the block and therefore can not be accessed after the block executes.
