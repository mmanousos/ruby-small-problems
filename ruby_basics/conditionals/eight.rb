# 8. Sleep Alert
# In the code below, status is randomly assigned as 'awake' or 'tired'.

status = ['awake', 'tired'].sample
# Write an if statement that returns "Be productive!" if status equals 'awake' and returns "Go to sleep!" otherwise. Then, assign the return value of the if statement to a variable and print that variable.

if status == 'awake'
	msg = "Be productive!"
else
	msg = "Go to sleep!"
end

puts msg

=begin
or can assign variable only once depending on the conditional
msg = if status == 'awake'
		"Be productive!"
	else
		"Go to sleep!"
	end
=end
