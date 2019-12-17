require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'

require_relative 'text'

class TestText < MiniTest::Test
  def setup
    @text = File.open('text.txt', 'r')
    @doc = Text.new(@text.read)
  end

# My solution - only checks single word for correct conversion,
# but it is a random word in the middle of the text. Still not a great solution.
# Better would be to count all the 'a's and 'e's before and compare to the
# number of 'e's afterward.
  def test_swap
    swapped = @doc.swap('a', 'e')
    words = swapped.split
    assert_equal(true, words[32] == 'messe')
  end

# Course Solution - checks full text
# Also creates Text object in #test method instead of #setup
  # def test_swap
  #   text = Text.new(@text.read)
  #   swapped = text.swap('a', 'e')
  #   expected_text = <<~TEXT
  #   Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
  #   Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
  #   quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
  #   nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
  #   dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
  #   et verius meuris, et pheretre mi.
  #   TEXT
  #   assert_equal(expected_text, swapped)
  # end

  def test_word_count
    assert_equal(72, @doc.word_count)
  end

  def teardown
    @text.close
    puts "File has been closed: #{@text.closed?}"
  end
end

# Test swap method - Text
# For this exercise you'll be given a sample text file and a starter class.
# The sample text's contents will be saved as a String to an instance variable
# in the starter class.
#
# The Text class includes a #swap method that can be used to replace all
# occurrences of one letter in the text with another letter. And for this
# exercise we will swap all occurrences of 'a' with 'e'.
#
# Your task is to write a test suite for class Text. In that test suite write a
# test for the Text method swap. For this exercise, you are required to use the
# minitest methods #setup and #teardown. The #setup method contains code that
# will be executed before each test; #teardown contains code that will be
# executed after each test.
