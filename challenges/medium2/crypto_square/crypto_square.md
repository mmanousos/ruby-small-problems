Crypto Square
Implement the classic method for composing secret messages called a square code.

The input is first normalized: The spaces and punctuation are removed from the English text and the message is down-cased.

Then, the normalized characters are broken into rows. These rows can be regarded as forming a rectangle when printed with intervening newlines.

For example, the sentence

"If man was meant to stay on the ground god would have given us roots"

is 54 characters long.

Broken into 8-character columns, it yields 7 rows.

Those 7 rows produce this rectangle when printed one per line:

```
ifmanwas
meanttos
tayonthe
groundgo
dwouldha
vegivenu
sroots
```

['ifmanwas',
'meanttos',
'tayonthe',
'groundgo',
'dwouldha',
'vegivenu',
'sroots']

The coded message is obtained by reading down the columns going left to right. For example, the message above is coded as:

`imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau`

Write a program that, given an English text, outputs the encoded version of that text.

The size of the square (number of columns) should be decided by the length of the message. If the message is a length that creates a perfect square (e.g. 4, 9, 16, 25, 36, etc), use that number of columns. If the message doesn't fit neatly into a square, choose the number of columns that corresponds to the smallest square that is larger than the number of characters in the message.

For example, a message 4 characters long should use a 2 x 2 square. A message that is 81 characters long would use a square that is 9 columns wide. A message between 5 and 8 characters long should use a rectangle 3 characters wide.

Output the encoded text grouped by column.

in: string
out: string of jumbled letters broken into "words" of the same length

AL:
- remove spaces and punctuation from text and downcase
- break the string into substrings of length based on the total number of letters
  - if the length is a perfect square, use that length
  - (e.g. 4, 9, 16, 25, 36, etc = 2, 3, 4, 5, 6, etc.)
  - otherwise use the next largest square that will fit the characters
- iterate through the new substrings creating one new string from all of the first letters, a second string from all of the second letters, etc.
- return all of the substrings joined into a single string, each separated by a space

normalize text
calculate the length of the normalized string
determine if it is a perfect square
  square = Math.sqrt(length).to_s
  if square[2].zero?
    => perfect square & strings should be square[0].to_i length
  else
    => not perfect square & need to go up by 1
    square[0].to_i + 1
break text into an array of substrings
  scan(/\w#{square}/)
iterate over substring array, collecting the letters at each index position
  counter = 0
  new_array = []
  new_string = ''
  each do |substring|
    new_string += substring[counter]
    new_array << new_string
  end

to return encoded string: new_array.join(' ')
