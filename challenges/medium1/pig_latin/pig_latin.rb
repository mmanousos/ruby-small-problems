class PigLatin
  SUFFIX = 'ay'

  def self.translate(phrase)
    phrase.split(' ').map { |word| translate_word(word) }.join(' ')
  end

  private

  def self.translate_word(word)
    vowel_sounds = /\A([xy][^aeiou]|[aeiou])/
    word.match(vowel_sounds) ? word + SUFFIX : move_consonants!(word) + SUFFIX
  end

  def self.move_consonants!(word)
    pieces = word.match(/\A([^aeiou]?qu|[^aeiou]*)([aeiou].*)\z/)
    pieces[2] + pieces[1]
  end
end
