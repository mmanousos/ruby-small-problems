=begin
*assignment*
Reverse Sentence
The reverse_sentence method should return a new string with the words of its
argument in reverse order, without using any of Ruby's built-in reverse methods.
However, the code below raises an error. Change it so that it behaves as
expected.

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = words[i] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'
=end

While trying to add the given word words[i] to the front of the array, it is
instructing an array to be added to a string using the '+' method which is
throwing the error. (Arrays can not be added to strings using the '+' method,
the '<<' or Array#concat method must be invoked.)

There are a couple of ways to solve for this:
looping through the words array backwards and using the shovel operator to add
the words to the end of the array (being sure to strip them of their leading
white space) and then joing the array before returning it.

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = words.length - 1

  while i >= 0
    reversed_words << words[i].strip
    i -= 1
  end

  reversed_words.join(' ')
end

For fewer changes to the original code, we can work forward using the
Array#unshift method to add each word to the front.

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words.unshift(words[i])
    i += 1
  end

  reversed_words.join(' ')
end

# Course Solution - convert string into one element array before adding
# (since arrays can be appended using the + method)
def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = [words[i]] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end
p reverse_sentence('how are you doing')
