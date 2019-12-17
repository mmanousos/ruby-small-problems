# Original Solution
# class Phrase
#   def initialize(string)
#     @string_array = remove_punctuation(string).split(/[,\s]/)
#   end
#
#   def remove_punctuation(string)
#     string
#       .downcase
#       .gsub(',', ' ')
#       .gsub(/\B'|'\B/, '')
#       .gsub(/[!&@\$%\^&:\n.]/, '')
#       .squeeze(' ')
#   end
#
#   def word_count
#     @string_array.each_with_object({}) do |word, hash|
#       if hash.keys.include?(word)
#         hash[word] += 1
#       else
#         hash[word] = 1
#       end
#     end
#   end
# end

# Refactor after reviewing course solutions
# class Phrase
#   def initialize(string)
#     @string = string
#   end
#
#   def split_string
#     @string.downcase.scan(/\b[\w']+\b/)
#   end
#
#   def word_count
#     words = split_string
#     words.each_with_object({}) do |word, hash|
#       if hash.keys.include?(word)
#         hash[word] += 1
#       else
#         hash[word] = 1
#       end
#     end
#   end
# end

# Second refactor including Further Exploration
# Further Exploration
# All 3 of the provided solutions have a small problem: if a word ends with an
# apostrophe (for instance, Louis' classroom), they will strip the apostrophe
# instead of including it in the word. Write a test to check for this condition,
# and use it to test your own program. If necessary, fix your code so it keeps
# the trailing apostrophes.
class Phrase
  def initialize(string)
    @string = string
  end

  def strip_quotes
    contents = @string.match(/['"][\w']+['"]/)
    @string.sub(/['"][\w']+['"]/, contents[0][1..-2])
  end

  def word_count
    count = Hash.new(0)
    if @string.match(/['"][\w']+['"]/)
      @string = strip_quotes
    end
    @string.downcase.scan(/\w+'\w|\w+'|\w+/) { |word| count[word] += 1 }
    count
  end
end

# Check if there are words that have single or double quotes.
# Replace quoted words with just the word itself.
# Split the string into words and build the hash of words counts. 
