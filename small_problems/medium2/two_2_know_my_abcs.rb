# Now I Know My ABCs
# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

# Examples:

# in: string (upper or lowercase)
# out: boolean
# AL:
#   set up the letter pairs in a hash constant
#   iterate over each letter of the argument string.
#   return false if the string also contains the value of the key or the value's key
#   otherwise return true

LETTERS = { 'B' => "O", "X" => "K", "D" => "Q", "C" => "P", "N" => "A", "G" => "T", "R" => "E", "F" => "S", "J" => "W", "H" => "U", "V" => "I", "L" => "Y", "Z" => "M" }

def block_word?(str)
  str.upcase!
  str.each_char do |ltr|
    if LETTERS.keys.include?(ltr)
      return false if str.include?(LETTERS[ltr])
    elsif LETTERS.values.include?(ltr)
      return false if str.include?(LETTERS.key(ltr))
    end
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
