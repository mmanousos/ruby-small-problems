# 6. What's My Value? (Part 6)
# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a

# throws an error because 'a' is not defined within the method.
# if 'a' were defined, the scope of the method means that now the variable 'a' points to 'a + a' within the method; but outside of it, the variable still points to 7.
