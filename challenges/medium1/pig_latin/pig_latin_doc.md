Pig Latin is a made-up children's language that's intended to be confusing. It obeys a few simple rules (below), but when it's spoken quickly it's really difficult for non-children (and non-native speakers) to understand.

- Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
- Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the word.

There are a few more rules for edge cases, and there are regional variants too.

If English isn't your primary language, Pig Latin may seem tricky. For a complete discussion of Pig Latin, see this [Wikipedia article](https://en.wikipedia.org/wiki/Pig_Latin). You can also watch the solution video from about the 3:30 point through about 10:30 without having the solution spoiled for you.

Problem
convert given string to pig latin
if word starts with vowel sound (first syllable), add 'ay' to end of word
if word starts with consonant (first syllable), move it to the end of the word and add 'ay' after

everything up to first vowel gets moved
'y' followed by another vowel gets moved but 'y' followed by consonant is considered a vowel.
'u' following 'q' both letters get moved.
'x' doesn't move followed by second consonant

if the first letter is a vowel, doesn't move => return string as is
if first letter is an x or y followed by a vowel => move to end
  otherwise return string as is
if the first vowel is a 'u', check if it is preceded by a 'q' and move first syllable + the 'u'
if the first letter is a consonant, the first syllable moves 

* partition at first vowel


Example / Tests

'pig' # => 'igpay'
'koala' # => 'oalakay'
'apple' # => 'appleay'
'ear' # => 'earay'
'chair' # => 'airchay'
'queen' # => 'eenquay'
'square' # => 'aresquay'
'therapy' # => 'erapythay'
'thrush' # => 'ushthray'
'school' # => 'oolschay'
'quick fast run' # => 'ickquay astfay unray'
'yellow' # => 'ellowyay'
'yttria' # => 'yttriaay'
'xenon' # => 'enonxay'
'xray' # => 'xrayay'

Data Structure


Algorithm
BEGIN
split string into separate words
iterate over each word
  split words into array of characters
  get index value of first vowel (aeiouy)
    if index = 0
      if value is 'y'
        get value of index 1
        if value is (aeiou), move to end
        otherwise, keep at front
    else
      if value is 'u'
        get value of index - 1
          if 'q', break everything from beginning of string through 'u' & move to end
      if consonant before first vowel == 'h, move to end  

  rejoin the string
  add 'ay' to end of the string
join all strings to single string   
return
END
