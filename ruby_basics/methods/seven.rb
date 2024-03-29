# 7. Naming Animals
=begin
Fix the following code so that the names are printed as expected.

def dog
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat}."
Expected output:

The dog's name is Spot.
The cat's name is Ginger.
=end

def dog(name) # this method needed a parameter so it could accept an argument
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat('Ginger')}." # this method call needed an argument provided because it has one parameter with no default. 
