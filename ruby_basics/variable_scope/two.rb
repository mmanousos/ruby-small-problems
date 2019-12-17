# 2. What's My Value? (Part 2)
# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a

# 7
# same as exercise 1 with new parameter (placeholder letter), doesn't change the fact that numbers are immutable. And while 'a' is modified within the method, that does not affect the original declaration.
