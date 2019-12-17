# Trolls are attacking your comment section!

# A common way to deal with this situation is to remove all of the vowels from the trolls' comments, neutralizing the threat.

# Your task is to write a function that takes a string and return a new string with all vowels removed.

# For example, the string "This website is for losers LOL!" would become "Ths wbst s fr lsrs LL!".

# Note: for this kata y isn't considered a vowel.

# in: string
# out: string minus all vowels (not including 'y')

# AL: examin each character in the string, checking if it matches 'aeiou'
# if yes, remove; if no, keep
# return new string

def disemvowel(str)
  str.tr('aeiouAEIOU', '')
end

p disemvowel("This website is for losers LOL!") == "Ths wbst s fr lsrs LL!"
