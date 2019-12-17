# 5. Mandatory Blocks
# The Array#bsearch method is used to search ordered Arrays more quickly than #find and #select can. Assume you have the following code:

a = [1, 4, 8, 11, 15, 19]
# How would you search this Array to find the first element whose value exceeds 8?

larger_than_eight = a.bsearch {|x| x > 8 }
puts larger_than_eight
# passes in each element of the array and returns the first one that meets the criteria (binary search evaluates each element true/false against the block)
#=> 11
# https://ruby-doc.com/core-2.3.3/Array.html#method-i-bsearch
