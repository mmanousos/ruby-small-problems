=begin
# What will the following program output?

hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end
=end

# guess:
Depending on the Ruby version, the program will print to screen "These hashes are the same!" because they contain the same keys and values but are not in the same order.

# Correct! 
