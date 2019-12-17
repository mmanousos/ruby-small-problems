=begin
*assignment*
Exclusive Or
The || operator returns a truthy value if either or both of its operands are
truthy, a falsey value if both operands are falsey. The && operator returns a
truthy value if both of its operands are truthy, and a falsey value if either
operand is falsey. This works great until you need only one of two conditions to
be truthy, the so-called exclusive or.

In this exercise, you will write a method named xor that takes two arguments,
and returns true if exactly one of its arguments is truthy, false otherwise.

Examples:
xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false

*problem*
A method that has two arguments. It evaluates each one for truthy-ness and
returns true only if only one evaluates as true, otherwise returns false.

*examples / test cases *
see above +
xor?(true, false) == true
xor?(true, true) == false
xor?(nil, true) == true
xor?('word', true) == false
xor?('word', false) == true

*data structures*
n/a

*algorithm*
START
  declare method (argument1, argument2)
    IF ((argument1 == true && argument2 == false) || (argument1 == false &&
         argument2 == true))
      return true
    ELSE
      return false
    end
  end
END
=end

# my solution
def xor?(arg1, arg2)
  if ((arg1 != true && arg2 != false) || (arg1 != false && arg2 != true))
    return true
  else
    return false
  end
end

# course solution
=begin
def xor?(arg1, arg2)
  (arg1 && !arg2) || (!arg1 && arg2)
end

I need to get better at remebering that I don't need to have explicit returns
for true / false, but it's easier for me to comprehend when writing them for now
=end

p xor?(5.even?, 4.even?) # => true
p xor?(5.odd?, 4.odd?) # => true
p xor?(5.odd?, 4.even?) # => false
p xor?(5.even?, 4.odd?) # => false
p xor?(true, false) # => true
p xor?(true, true) # => false
p xor?(nil, true) # => true
p xor?(!!'word', true) # => false
p xor?('word', false) # => true

# Further Exploration
=begin
Can you think of a situation in which a boolean xor method would be useful?
Suppose you were modeling a light at the top of a flight of stairs wired in such
a way that the light can be turned on or off using either the switch at the
bottom of the stairs or the switch at the top of the stairs. This is an xor
configuration, and it can be modeled in ruby using the xor method. Think of some
additional examples.
=end
I can think of any right now where if both are true or both are false then the
method evaluates to false but if a single of the options is true while the other
is false, then the method evaluates to true.

=begin
|| and && are so-called short circuit operators in that the second operand is
not evaluated if its value is not needed. Does the xor method perform
short-circuit evaluation of its operands? Why or why not? Does short-circuit
evaluation in xor operations even make sense?
=end

xor? is not a short-circuit evaluation. All of the values need to be evaluated
to determine truthyness of the entire method. If the first value were true, we
still need to know if the second one is true or false to evaluate correctly. 
