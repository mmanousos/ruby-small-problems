=begin
*assignment*
String Assignment
Take a look at the following code:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name
What does this code print out? Think about it for a moment before continuing.
If you said that code printed

Alice
Bob
you are 100% correct, and the answer should come as no surprise. Now, let's look
at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
What does this print out? Can you explain these results?
=end

=>
BOB
BOB

The original variable 'name' points to the string 'Bob'. 'save_name' is then
declared and pointed to the same string. 'name.upcase!' mutates the string both
varibales are pointing to making it 'BOB', so the method call puts of both
variables displays 'BOB' twice.
