=begin
What will each block of code below print to the screen?

1. '4' == 4 ? puts("TRUE") : puts("FALSE")

2. x = 2
   if ((x * 3) / 2) == (4 + 4 - x - 3)
     puts "Did you get it right?"
   else
     puts "Did you?"
   end

3. y = 9
   x = 10
   if (x + 1) <= (y)
     puts "Alright."
   elsif (x + 1) >= (y)
     puts "Alright now!"
   elsif (y + 1) == x
     puts "ALRIGHT NOW!"
   else
     puts "Alrighty!"
   end
=end

	 1. "FALSE"
	 2. "Did you get it right?"
	 3. "Alright now!" # even though (y+1) is equal to x, the condition returns after it evaluates (x+1) >= (y)
