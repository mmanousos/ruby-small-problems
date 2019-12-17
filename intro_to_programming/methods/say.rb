=begin
def say
	puts "hello"
	puts "hi"
	puts "how are you"
	puts "I'm fine"
end
=end

=begin
def say(words) # 'words' is the parameter
	puts words + '.'
end

say("hello") # 'hello' is the argument
say("hi")
say("how are you")
say("I'm fine")
=end

def say(words='hello')
	puts words + '.'
end

say()
say("hi")
say("how are you")
say("I'm fine")
