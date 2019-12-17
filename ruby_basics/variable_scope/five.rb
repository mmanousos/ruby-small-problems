# 5. What's My Value? (Part 5)
# What will the following code print, and why? Don't run the code until you have tried to answer.

a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a

# "Xyzzy"
# b is a new object, not a modification of the one previously declared in a 
