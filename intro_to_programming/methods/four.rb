=begin
What will the following code print to the screen?

def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")
=end

This method call should evaluate to print nothing to the screen. But the variable 'words' will point to the value 'Yippeee!!!!'
