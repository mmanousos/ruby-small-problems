=begin
What does the each method in the following program return after it is finished executing?

x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end
=end

the .each iterator method passes the elements of the array through the expression, adding 1 to them, and returning an array [2, 3, 4, 5, 6]
