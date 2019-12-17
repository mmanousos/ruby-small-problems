=begin
*assignment*
Count the number of Duplicates
Write a function that will return the count of distinct case-insensitive
alphabetic characters and numeric digits that occur more than once in the input
string. The input string can be assumed to contain only alphabets (both
uppercase and lowercase) and numeric digits.

*problem*
input: string containing letters and numbers exclusively (can be either case)
output: integer for the number of duplicated numbers or letters (case-insensitive)

use RegEx\i or downcase everything


*examples / test cases *
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (bandB)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice

*data structures*
array

*algorithm*
BEGIN
  declare method that accepts a single string as an argument
    SET dupes = [] hold all the duplicate characters
    SET string = string.downcase
    WHILE characters remain in string
      examine each character for duplicates
      IF string contains duplicates of that character
        push it to the dupes array
      end
    end
    PRINT dupes.uniq.size (reduce the array to uniq characters then count them)
END
=end

def duplicate_count(text)
  text = text.downcase
  dupes = []
  text.each_char do |char|
    if text.count(char) > 1
      dupes << char
    end
  end
  dupes.uniq.size
end

p duplicate_count("abcde") == 0 # no characters repeats more than once
p duplicate_count("aabbcde") == 2 # 'a' and 'b'
p duplicate_count("aabBcde") == 2 # 'a' occurs twice and 'b' twice (bandB)
p duplicate_count("indivisibility") #== 1 # 'i' occurs six times
p duplicate_count("Indivisibilities") #== 2 # 'i' occurs seven times and 's' occurs twice
p duplicate_count("aA11") == 2 # 'a' and '1'
p duplicate_count("ABBA") == 2 # 'A' and 'B' each occur twice
