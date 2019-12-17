# 1. What's My Value? (Part 1)
# What will the following code print and why? Don't run it until you have tried to answer.

a = 7

def my_value(b)
  b += 10
end

my_value(a)
puts a

# 7
# numbers are immutable, while a is modified within the method, that does not affect the original declaration.
