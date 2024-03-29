# 4. Greeting Through Methods (Part 2)
=begin
Write a method named greet that invokes the following methods:

def hello
  'Hello'
end

def world
  'World'
end
When greet is invoked with #puts, it should output the following:

Hello World
Make sure you add a space between "Hello" and "World", however, you're not allowed to modify hello or world.
=end

def hello
  'Hello'
end

def world
  'World'
end

def greet
	puts hello + ' ' + world
	# puts "#{hello} #{world}" could also do this but it's less clear that the functions are being called. 
end

greet
