class Board
  CHECKS = [:left?, :right?, :top?, :bottom?, :top_diag_left?, :top_diag_right?,
            :bot_diag_left?, :bot_diag_right?]

  def self.transform(input)
    raise ValueError if invalid_length?(input) ||
                        invalid_border?(input) ||
                        invalid_characters?(input)

    input.map.with_index do |string, str_idx|
      if string =~ /[ ]/
        transform_strings(string, str_idx, input)
      else
        string
      end
    end
  end

  def self.invalid_length?(input)
    string_length = input[0].length
    input.any? { |string| string.length != string_length }
  end

  def self.invalid_characters?(input)
    input.any? { |string| string =~ /[^ |*\-\+]/ }
  end

  def self.invalid_border?(input)
    horizontal_pattern = /[^(\+\-+\+)]/
    return true if input[0] != input[-1] ||
                   input[0] =~ horizontal_pattern ||
                   input[-1] =~ horizontal_pattern ||
                   input[1..-2].any? { |str| (str =~ /\|[* ]+\|/).nil? }
  end

  def self.transform_strings(string, str_idx, input)
    str_chars = string.chars
    new_str = str_chars.map.with_index do |char, char_idx|
      char == ' ' ? transformed_char(input, str_idx, str_chars, char_idx) : char
    end
    new_str.join
  end

  def self.transformed_char(input, str_idx, str_chars, char_idx)
    counter = 0
    CHECKS.each do |method|
      counter += 1 if send(method, input, str_idx, str_chars, char_idx)
    end
    counter != 0 ? counter : ' '
  end

  def self.left?(_, _, characters, idx2)
    characters[idx2 - 1] == '*'
  end

  def self.right?(_, _, characters, idx2)
    characters[idx2 + 1] == '*'
  end

  def self.top?(strings, idx1, _, idx2)
    strings[idx1 - 1][idx2] == '*'
  end

  def self.bottom?(strings, idx1, _, idx2)
    strings[idx1 + 1][idx2] == '*'
  end

  def self.top_diag_left?(strings, idx1, _, idx2)
    strings[idx1 - 1][idx2 - 1] == '*'
  end

  def self.top_diag_right?(strings, idx1, _, idx2)
    strings[idx1 - 1][idx2 + 1] == '*'
  end

  def self.bot_diag_left?(strings, idx1, _, idx2)
    strings[idx1 + 1][idx2 - 1] == '*'
  end

  def self.bot_diag_right?(strings, idx1, _, idx2)
    strings[idx1 + 1][idx2 + 1] == '*'
  end
end

class ValueError < ArgumentError
  def initialize(msg='Unbalanced board, faulty border, or unrecognized ' \
    'characters')
    super
  end
end
