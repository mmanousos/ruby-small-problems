=begin
*assignment*
Madlibs
Mad libs are a simple game where you create a story template with blanks for
words. You, or another player, then construct a list of words and place them
into the story, creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and
an adjective and injects those into a story that you create.

Example
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

*problem*
input: four user input strings
output: user input strings interpolated into a final string printed to screen

*examples / test cases *
see above

*data structures*
string

*algorithm*
BEGIN
  GET and SET noun, verb, adjective, and adverb
  PRINT Do you 'verb' your 'adjective' 'noun' 'adverb'? That's hilarious!
END
=end

def prompt(msg)
  puts "=>#{msg}"
end

prompt('Please give me a noun:')
noun = gets.chomp
prompt('Please give me a verb:')
verb = gets.chomp
prompt('Please give me a adjective:')
adjective = gets.chomp
prompt('Please give me a adverb:')
adverb = gets.chomp

prompt("I like to #{verb} #{adverb} with my #{adjective} #{noun}. Don't you?")
