# 1) Edit the method definition in exercise #4 so that it does print words on the screen. 2) What does it return now?

=begin
def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")
=end

def scream(words)
  words = words + "!!!!"
  puts words
end

scream("Yippeee")

# This method call evaluates to print 'Yippeee!!!!' to the screen. (implicit return)
