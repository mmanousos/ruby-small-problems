=begin

You run the following code...

names = ['bob', 'joe', 'susan', 'margaret']
names['margaret'] = 'jody'
...and get the following error message:

TypeError: no implicit conversion of String into Integer
  from (irb):2:in `[]='
  from (irb):2
  from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'
What is the problem and how can it be fixed?

=end

The error message is telling you that it can not convert the name 'margaret' into a number to access the index where 'margaret' is stored to replace it with 'jody'.
Instead use the value of the index 3, to access and replace the value with 'jody'. 
