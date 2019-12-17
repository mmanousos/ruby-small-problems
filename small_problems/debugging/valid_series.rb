=begin
*assignment*
Valid Series?
The valid_series? method checks whether a series of numbers is valid. For the
purposes of this exercise, a valid series of numbers must contain exactly three
odd numbers. Additionally, the numbers in the series must sum to 47.

Unfortunately, our last test case is not returning the expected result. Why is
that?

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count = 3 ? true : false
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        == true
p valid_series?([1, 12, 2, 5, 16, 6])             == false
p valid_series?([28, 3, 4, 7, 9, 14])             == false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        == true
p valid_series?([10, 6, 19, 2, 6, 4])             == false

input: array of numbers
output: boolean

rules:
must contain exactly 3 odd numbers
must add up 47
=end


Line 5 was reassigning the variable 'odd_count' to 3 (using a single =) instead of checking it for equivalence (==)
Adding the missing equal sign corrects the method and allows the tests to pass.

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3 ? true : false
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])  == true
p valid_series?([1, 12, 2, 5, 16, 6])       == false
p valid_series?([28, 3, 4, 7, 9, 14])       == false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])  == true
p valid_series?([10, 6, 19, 2, 6, 4])       == false

# Further Exploration
=begin
If you take a close look at odd_count == 3 ? true : false, you see that the
equality comparison odd_count == 3 itself returns a Boolean. Is the ternary
operator on line 5 really necessary in order to return a Boolean from our
method?
=end

No, the ternary is not necessary but does make it more clear what the return
value will be (which is helpful for newer programmers like me).
