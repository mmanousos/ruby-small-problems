=begin
# Crypto Square

Implement the classic method for composing secret messages called a square code.

Given an English text, output the encoded version of that text.

First, the input is normalized: the spaces and punctuation are removed
from the English text and the message is downcased.

Then, the normalized characters are broken into rows.  These rows can be
regarded as forming a rectangle when printed with intervening newlines.

For example, the sentence

> If man was meant to stay on the ground, god would have given us roots.

is normalized to:

> ifmanwasmeanttostayonthegroundgodwouldhavegivenusroots

The plaintext should be organized in to a rectangle.  The size of the
rectangle (`r x c`) should be decided by the length of the message,
such that `c >= r` and `c - r <= 1`, where `c` is the number of columns
and `r` is the number of rows.

Our normalized text is 54 characters long, dictating a rectangle with
`c = 8` and `r = 7`:

```text
ifmanwas
meanttos
tayonthe
groundgo
dwouldha
vegivenu
sroots
```

The coded message is obtained by reading down the columns going left to
right.

The message above is coded as:

```text
imtgdvsfearwermayoogoanouuiontnnlvtwttddesaohghnsseoau
```

Output the encoded text in chunks.  Phrases that fill perfect rectangles
`(r X c)` should be output `c` chunks of `r` length, separated by spaces.
Phrases that do not fill perfect rectangles will have `n` empty spaces.
Those spaces should be distributed evenly, added to the end of the last
`n` chunks.

```text
imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau
```

Notice that were we to stack these, we could visually decode the
cyphertext back in to the original message:

```text
imtgdvs
fearwer
mayoogo
anouuio
ntnnlvt
wttddes
aohghn
sseoau
```

=end


require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

module BookKeeping
  VERSION = 1
end

class Crypto
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def ciphertext
    text # enter method text here
  end
end

class CryptoSquareTest < Minitest::Test
  def test_empty_plaintext_results_in_an_empty_ciphertext
    # skip
    plaintext = ''
    assert_equal "", Crypto.new(plaintext).ciphertext
  end

  def test_lowercase
    # skip
    plaintext = 'A'
    assert_equal "a", Crypto.new(plaintext).ciphertext
  end

  def test_remove_spaces
    # skip
    plaintext = '  b '
    assert_equal "b", Crypto.new(plaintext).ciphertext
  end

  def test_remove_punctuation
    # skip
    plaintext = '@1,%!'
    assert_equal "1", Crypto.new(plaintext).ciphertext
  end

  def test_9_character_plaintext_results_in_3_chunks_of_3_characters
    # skip
    plaintext = 'This is fun!'
    assert_equal "tsf hiu isn", Crypto.new(plaintext).ciphertext
  end

  def test_8_character_plaintext_results_in_3_chunks_the_last_one_with_a_trailing_space
    # skip
    plaintext = 'Chill out.'
    assert_equal "clu hlt io ", Crypto.new(plaintext).ciphertext
  end

  def test_54_character_plaintext_results_in_7_chunks_the_last_two_with_trailing_spaces
    # skip
    plaintext = 'If man was meant to stay on the ground, god would have given us roots.'
    assert_equal "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ", Crypto.new(plaintext).ciphertext
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    # skip
    assert_equal 1, BookKeeping::VERSION
  end
end
