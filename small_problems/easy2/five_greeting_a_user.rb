=begin
*assignment*
Greeting a user
Write a program that will ask for user's name. The program will then greet the
user. If the user writes "name!" then the computer yells back to the user.

Examples
What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?

*problem*
get name input from user
asses if user uses '!' as part of their input string
return greeting string, all caps if input string ends with '!'
assume input is a valid string (not an array, integer, or other object)

*examples / test cases *
in: Bob => Hello Bob.
in: Bob! => HELLO BOB. WHY ARE WE SCREAMING?
in: ! => I DON'T USUALY SCREAM AT STRANGERS!
in: '' => Hello. You must be a ghost with no name.

*data structures*
Strings.

*algorithm*
START
  PUT "What's your name?"
  GET and SET name = input
  IF string is empty
    reply = 'Hello. You must be a ghost with no name.'
  ELSEIF string only contains '!'
    reply = "I DON'T USUALY SCREAM AT STRANGERS!"
  ELSEIF string ends with '!'
    reply = 'HELLO ' + name.upcase + '. WHY ARE WE SCREAMING?'
  ELSE
    reply = 'Hello, ' + name.capitalize + "."
  PRINT reply
END
=end

puts "What's your name?"
name = gets.chomp

if name.empty?
  reply = 'Hello. You must be a ghost with no name.'
elsif name == '!'
  reply = "I DON'T USUALY SCREAM AT STRANGERS!"
elsif name.end_with?('!')
  minus_bang = name.chop
  reply = 'HELLO ' + minus_bang.upcase + '. WHY ARE WE SCREAMING?'
else
  reply = 'Hello, ' + name.capitalize + "."
end

puts reply
