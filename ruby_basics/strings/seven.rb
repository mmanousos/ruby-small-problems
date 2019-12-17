# 7. Goodbye, not Hello
=begin
Given the following code, invoke a destructive method on greeting so that Goodbye! is printed instead of Hello!.

greeting = 'Hello!'
puts greeting
Expected output:

	Goodbye!
=end

greeting = 'Hello!'
# greeting = "Goodbye!" could simply reassign the variable but doesn't qualify as a 'destructive method' requested in the problem.
greeting.replace "Goodbye!" # #replace works
# greeting.gsub('Hello!', 'Goodbye!') global sub (#gsub) also works but is longer and not necessary since we only have one instance we are searching for and the entire string is being replaced. 
puts greeting
