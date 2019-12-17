Consider a character set consisting of letters, a space, and a point. Words consist of one or more, but at most 20 letters. An input text consists of one or more words separated from each other by one or more spaces and terminated by 0 or more spaces followed by a point. Input should be read from, and including, the first letter of the first word, up to and including the terminating point. The output text is to be produced such that successive words are separated by a single space with the last word being terminated by a single point. Odd words are copped in reverse order while even words are merely echoed. For example, the input string:

"whats the matter with kansas." == "whats eht matter htiw kansas."
'why are we in this place.' == 'why era we ni this ecalp.'
'who are you.' == 'who era you.'

BONUS points: the characters must be read and printed one at a time.

words are not longer than 20 characters.
"odd" words means odd in terms of index value within the string.
first word = 0 index value;
second word = 1 index value = reversed

questions:
only lower case letters? (shouldn't matter)
does the input string have to have a space? what if it's only one word?
no punctuation other than period at the end of the sentence? do we need to check for other punctuation or periods elsewhere in the input?
should there be an error message if the input is invalid? (e.g. no letters, no spaces, no ending period)
what is meant by 'printed' one at a time?

create empty array to hold evaluated words
create empty temp string to hold currently evaluated characters
iterate over input string
examine each character:
  if it is a letter, append it to the temp string
  if it is a space or period
    check number of elements in the array
      if odd? reverse temp string
    push a copy of the temp string to array
    clear temp string
join results array separated by spaces, append a period, return
