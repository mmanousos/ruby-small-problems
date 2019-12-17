=begin
*assignment*
Duplicate Encoder
The goal of this exercise is to convert a string to a new string where each
character in the new string is '(' if that character appears only once in the
original string, or ')' if that character appears more than once in the original
string. Ignore capitalization when determining if a character is a duplicate.


*problem*
input: string of characters (can be letters, punctuation, spaces, etc.)
output: a new string containing only open and closed parentheses: open '(' if
the character appears only once in the original; closed ')' if more than once.

ignore capitalization when checking for repetition.

*examples / test cases *
"din" => "((("
"recede" => "()()()"
"Success" => ")())())"
"(( @" => "))(("

*data structures*
strings

*algorithm*
BEGIN
  declare a method that takes a single string as an argument
    SET string = string downcase
    SET new_string = '' to return
    iterate over each character in the string.
      IF current character appears multiple times in original string
        add ')' to new_string
      ELSE
        add '(' to new_string
      end
    end
    PRINT new_string
END
=end
=begin
def encode(str)
  new_str = ''
  str = str.downcase
  str.each_char do |char|
    str.count(char) > 1 ? new_str += ')' : new_str += '('
  end
  new_str
end
=end
def encode(str)
  str.downcase.chars.map { |c| str.downcase.count(c) > 1 ? ')' : '(' }.join
end

p encode("din") == "((("
p encode("recede") == "()()()"
p encode("SucceSs") == ")())())"
p encode("(( @") == "))(("
