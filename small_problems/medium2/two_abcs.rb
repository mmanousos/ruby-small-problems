=begin
*assignment*
Now I Know My ABCs
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M
This limits the words you can spell with the blocks to just those words that do
not use both letters from any given block. Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be
spelled from this set of blocks, false otherwise.

Examples:
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

*problem*
input: string
output: boolean

for each letter of the string, check if its pair letter is also present in the string.
if yes, false
if no, true it can be spelled with the blocks.

*examples / test cases *
see above

*data structures*
hash constant
array from string to iterate over

*algorithm*
# array method
BEGIN
  SET constant blocks = array containing block letter pairs
  declare method that takes a single string (word) as an argument
    SET word_arr = word split into component letters
    WHILE letters remain to be checked
      access each letter
      check against blocks constant
      IF blocks subarray.size == 2
        remove letter from its sub array
      ELSE
        PRINT false
    PRINT true
END

# hash method
BEGIN
  SET constant BLOCKS = hash containing block letter pairs
  declare method that takes a single string (word) as an argument
    SET word_arr = word to uppercase split into component letters
    WHILE letters remain to be checked
      access each letter
      check against BLOCKS constant =>
      IF word_arr contains BLOCKS[letter.to_symbol]  (.to_sym)
        PRINT false
      ELSEIF word_arr contains BLOCKS.key(letter)
        PRINT false
    PRINT true
END
=end

# BLOCKS = [[B, O], [X, K], [D, Q], [C, P], [N, A], [G, T], [R, E], [F, S],
# [J, W], [H, U], [V, I], [L, Y], [Z, M]]

BLOCKS = { B:'O', X:'K', D:'Q', C:'P', N:'A', G:'T', R:'E', F:'S', J:'W', H:'U',
           V:'I', L:'Y', Z:'M'}

def block_word?(word)
  word_arr = word.upcase.chars
  word_arr.each do |letter|
    if word_arr.include?(BLOCKS[letter.to_sym]) || word_arr.include?(BLOCKS.key(letter))
      return false
    end
  end
  true
end

# Course Solution
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('sass') == false
