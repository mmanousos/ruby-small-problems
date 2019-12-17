# 7. Default Arguments in the Middle
=begin
Consider the following method and a call to that method:

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

Use the ruby documentation to determine what this code will print.
=end

[4,5,3,6]

Just looking at the problem, I thought this method call would result in an error indicating that only 3 arguments were passed but 4 were expected.
But reading the documentation and testing it in irb, I see that the second argument replaces the default value, the default subs in for the third value, and the third argument slots in for the fourth parameter.
# https://ruby-doc.com/core-2.3.3/doc/syntax/methods_rdoc.html#label-Default+Values
# https://ruby-doc.com/core-2.3.3/doc/syntax/calling_methods_rdoc.html#label-Default+Positional+Arguments
