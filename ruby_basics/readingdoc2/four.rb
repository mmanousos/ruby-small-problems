# 4. Optional Arguments Redux

=begin
Assume you have the following code:

require 'date'

puts Date.new # 1
puts Date.new(2016) # 2
puts Date.new(2016, 5) # 3
puts Date.new(2016, 5, 13) # 4

What will each of the 4 puts statements print?
=end

1. -4712-01-01 # generic year with first day of first month
2. 2016-01-01 # the first day of the first month of the provided year
3. 2016-05-01 # the first day of the provided month and year
4. 2016-05-13 # the provided year, month and day

# https://ruby-doc.com/stdlib-2.3.3/libdoc/date/rdoc/Date.html#method-c-civil
# https://ruby-doc.com/stdlib/libdoc/date/rdoc/Date.html#method-c-new
