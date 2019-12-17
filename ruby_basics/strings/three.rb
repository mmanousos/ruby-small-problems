# 3. Ignoring Case
#Using the following code, compare the value of name with the string 'RoGeR' while ignoring the case of both strings. Print true if the values are the same; print false if they aren't. Then, perform the same case-insensitive comparison, except compare the value of name with the string 'DAVE' instead of 'RoGeR'.

name = 'Roger'

=begin
Expected output:

true
false
=end

# using RegEx
if /RoGeR/i =~ name
	puts true
else
	puts false
end

# or shorter syntax
puts true if /RoGeR/i =~ name


if /DAVE/i =~ name
	puts true
else
	puts false
end

# shorter syntax
puts true if /DAVE/i =~ name
puts false if /DAVE/i != name


# course instructs to use #casecmp
# casecmp always ignores case but evaluates if strings are greater or less than one another. if first string (calling string) is greater (than the provided argument), result is 1; equivalent, 0; first string less, -1.
# 'RoGeR'.casecmp(name) == 0
# 'DAVE'.casecmp(name) == 0
