# 3. Optional Arguments
=begin
Assume you have the following code:

s = 'abc def ghi,jkl mno pqr,stu vwx yz'
puts s.split.inspect # 1
puts s.split(',').inspect # 2
puts s.split(',', 2).inspect # 3
What will each of the 3 puts statements print?
=end

1. ['abc', 'def' 'ghi,jkl', 'mno', 'pqr,stu', 'vwx', 'yz'] # splits on the whitespace
2. ['abc def ghi', 'jkl mno pqr', 'stu vwx yz'] # splits on the commas
3. ['abc def ghi', 'jkl mno pqr,stu vwx yz'] # splits on the commas but into a max of 2 fields
# https://ruby-doc.com/core-2.3.3/String.html#method-i-split
