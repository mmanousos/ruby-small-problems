# 8. Print Until
=begin
Given the array of several numbers below, use an until loop to print each number.

numbers = [7, 9, 13, 25, 18]
Expected output:

7
9
13
25
18
=end

numbers = [7, 9, 13, 25, 18]

until numbers.length == 0 # count number of elements in the array
	puts numbers.first # print the first value of the array
	numbers.shift # remove the first value of the array so the count will decrease with each iteration
end
# This solution is destructive to the array.
# Could also use a counter (starting at 0) to cycle through, but using an iterative method (such as '.each') would be easier than any of these.
