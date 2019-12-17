# 4. Return Value of break
# In the previous exercise, you learned that the while loop returns nil unless break is used. Locate the documentation for break, and determine what value break sets the return value to for the while loop.

Typically "nil" but also...
""break" accepts a value that supplies the result of the expression it is “breaking” out of."
(Meaning you can specify what value is returned by altering the value that "broke" the operation.
e.g. break value * 2 if value.even? )


# https://ruby-doc.org/core-2.2.0/doc/syntax/control_expressions_rdoc.html#label-break+Statement
