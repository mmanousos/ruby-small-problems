class Diamond
  ALPHABET = [*'A'..'Z'].freeze

  def self.make_diamond(letter)
    index_of_letter = ALPHABET.index(letter)
    @distance = index_of_letter
    @between = 1
    result = []

    letters = ALPHABET[0..index_of_letter]
    build_top(result, letters)
    build_bottom(result, letters) unless index_of_letter == 0
    result.join
  end

  class << self
    private

    def first_last_letter(char)
      "#{' ' * @distance}#{char}#{' ' * @distance}\n"
    end

    def other_letter(char)
      "#{' ' * @distance}#{char}#{' ' * @between}#{char}#{' ' * @distance}\n"
    end

    def determine_row(char)
      char == ALPHABET[0] ? first_last_letter(char) : other_letter(char)
    end

    def build_top(result, letters)
      letters.each do |char|
        result << determine_row(char)
        break if result.size == letters.size
        @distance -= 1
        @between += 2 if char >= 'B'
      end
    end

    def build_bottom(result, letters)
      letters.reverse_each do |char|
        next if char == letters[-1]
        @distance += 1
        @between -= 2
        result << determine_row(char)
      end
    end
  end
end

# Clever Student Solution
class Diamond
  def self.make_diamond(letter)
    letters = ("A"..letter).to_a
    default_pattern = (letters.reverse + letters[1..-1]).join
    letter_on_each_row = letters + letters.reverse[1..-1]

    diamond = ""
    letter_on_each_row.each do |letter|
      diamond += default_pattern.gsub(/[^#{letter}]/, " ")+"\n"
    end
    diamond
  end
end
# builds default pattern, then creates diamond rows by simply removing every
# character from that pattern that isn't the letter for that row
