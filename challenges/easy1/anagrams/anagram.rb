class NonLetterError < ArgumentError
  def initialize(msg = 'Must contain only letters')
    super
  end
end

class Anagram
  NON_LETTERS = /[^A-Z]/i

  def initialize(word)
    @word = word
  end

  def match(options)
    check_letters(@word)

    word_sorted = sort_letters(@word)
    options.select do |option|
      check_letters(option)
      !same_word?(option) && word_sorted == sort_letters(option)
    end
  end

  private

  def sort_letters(word)
    word.downcase.chars.sort
  end

  def same_word?(phrase)
    @word.casecmp?(phrase)
  end

  def check_letters(phrase)
    raise NonLetterError if phrase =~ NON_LETTERS
  end
end
