=begin
#*assignment*
Password
The following code prompts the user to set their own password if they haven't
done so already, and then prompts them to login with that password. However, the
program throws an error. What is the problem and how can you fix it?

Once you get the program to run without error, does it behave as expected?
Verify that you are able to log in with your new password.

password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password
end

def verify_password
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  set_password
end

verify_password
=end

The password variable is reassigned to 'new_password' within the method
set_password but that new value is not returned to be able to be evaluated in
verify_password.
First password needs to be reassigned to the return value of set_password.
Then the password variable should be passed as an argument to the
verify_password method for it to be accessed properly.

password = nil

def set_password
  puts passkey.object_id
  puts 'What would you like your password to be?'
  new_password = gets.chomp
end

def verify_password(passkey)
  puts passkey.object_id
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == passkey
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)
