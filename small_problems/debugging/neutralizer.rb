=begin
*assignment*
Neutralizer
We wrote a neutralize method that removes negative words from sentences.
However, it fails to remove all of them. What exactly happens?

def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
=end

Because the String#delete method mutates the array words as it is being iterated
over using the Array#each method, the word following the deleted word is skipped.
To visualize, the array words is broken down into 0: these, 1: dull, 2: boring, etc. ...
When Array#each reaches words[1], "dull" exisits in the negative? words array,
so it is deleted immediately, which shifts everything following it down one
position in the index. Now "boring" is in index position 1, but because the #each
method has already evaluated position 1, it moves on to index position 2,
"cards", skipping "dull".

# Course Solution - Instead of mutating the array during iteration, use a method
# like Array#reject! or Array#select to iterate rejecting the elements we don't
# want / keeping only the elements we do want.
def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! { |word| negative?(word) }
  words.join(' ')
end

# Further Exploration
Note that we use reject! here, which does mutate the array while iterating over
it. But the way reject! is implemented, it takes special care to avoid the
problem we had in our code. We could re-implement it in Ruby as follows:

def mutating_reject(array)
  i = 0
  loop do
    break if i == array.length

    if yield(array[i]) # if array[i] meets the condition checked by the block
      array.delete_at(i)
    else
      i += 1
    end
  end

  array
end
For now, just read if yield(array[i]) as "if array[i] meets the condition
checked by the block"; you will learn about using blocks in methods in course
130. The important point is that i is not increased when the condition is met
and the element is removed. This prevents the loop from skipping over elements
like what happened in our case.
