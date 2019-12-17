class Scrabble
  LETTER_VALUES = { %w(A E I O U L N R S T) => 1,
                    %w(D G)                 => 2,
                    %w(B C M P)             => 3,
                    %w(F H V W Y)           => 4,
                    %w(K)                   => 5,
                    %w(J X)                 => 8,
                    %w(Q Z)                 => 10
                  }

  def self.score(word)
    new(word).score
  end

  def standardize_input(word)
    word.to_s.gsub(/[^a-zA-Z]/, '')
  end

  def initialize(word)
    word = standardize_input(word)
    @word = word.strip.upcase
  end

  def score
    0 if @word.empty?

    @word.chars.map{|letter| letter_value(letter)}.sum
  end

  def letter_value(letter)
    LETTER_VALUES[LETTER_VALUES.keys.find { |key| key.include?(letter) }]
  end
end
