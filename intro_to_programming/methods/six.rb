=begin
What does the following error message tell you?
ArgumentError: wrong number of arguments (1 for 2)
  from (irb):1:in `calculate_product'
  from (irb):4
  from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'
=end

This error indicates that the method 'calculate_product' was not passed enough arguments with the method call (only 1 was passed but 2 were expected) (and it happened on line 4 of the program).
My version of Ruby (2.3.3p222) renders this message as "wrong number of arguments (given 1, expected 2)" which is slightly more explicit. 
