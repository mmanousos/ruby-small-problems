# 3. What's My Value? (Part 3)
# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(b)
  a = b
end

my_value(a + 5)
puts a

# 7
# numbers continue to be immutable. The scope of the method dictates that while within the method a = 12, but outside of it a = 7. 
