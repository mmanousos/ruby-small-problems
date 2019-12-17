=begin
** PRACTICE PROBLEMS FROM 109 STUDY GROUP 8/14/18 **

Consider the word "abode". We can see that the letter a is in position 1 and b
is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice
also that d and e in abode occupy the positions they would occupy in the
alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy
their positions in the alphabet for each word. For example,
solve(["abode","ABc","xyzD"]) == [4,3,1].

Input will consist of alphabet characters, both uppercase and lowercase.
No spaces.

input: array of strings, both upper and lowercase characters
output: array of integers representing how many characters correspond to their placement within the alphabet.

AL: downcase all the letters
loop through each element of the argument array, checking each character of the string against its placement in the alphabet.
increment a counter and then return that counter to a new array that will be returned for the final answer.

SET an array constant to represent the letters of the alphabet and their corresponding index values.
declare a method that accepts an array of strings as an argument
  WHILE the array has elements remaining to check
    counter = 0
    access each string, downcase the string & break the string into characters
      compare the character and index to the corresponding character in the constant
        IF they match, increment counter
        return counter into new array


ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
def solve(arr)
  arr.map do |str|
    counter = 0
    chars = str.downcase.split('')
    chars.each_with_index do |char, idx|
      if idx == ALPHABET.index(char)
        counter += 1
      end
    end
    counter
  end
end

p solve(["abode","ABc","xyzD"]) == [4,3,1]
=end

=begin
Given a string made of digits [0-9], return a string where each digit is
repeated a number of times equals to its value.

input: string of integers
output: new string with same integers but each repeated the number of times equal to its value (e.g. 5 => 55555)

AL: split string into an array of digits (#chars)
transform those digits into repeated digits equal to their value (#times)
rejoin the array and return
=end

def digits_explode(str)
  digits = str.chars
  results = digits.map do |num_str|
    new_str = ''
    num_str.to_i.times do
      new_str += num_str
    end
    new_str
  end
  results.join
end


p digits_explode("312") #== "333122"
p digits_explode("102269") #== "12222666666999999999"
