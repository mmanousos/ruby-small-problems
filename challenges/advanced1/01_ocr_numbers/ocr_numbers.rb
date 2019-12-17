class OCR
  NUMBERS = {
              " _ \n| |\n|_|" => '0',
              "   \n  |\n  |" => '1',
              " _ \n _|\n|_ " => '2',
              " _ \n _|\n _|" => '3',
              "   \n|_|\n  |" => '4',
              " _ \n|_ \n _|" => '5',
              " _ \n|_ \n|_|" => '6',
              " _ \n  |\n  |" => '7',
              " _ \n|_|\n|_|" => '8',
              " _ \n|_|\n _|" => '9'
            }
    BREAKPOINT = "\n\n"

  def initialize(text)
    @text = text
  end

  def convert
    if multiple_lines?
      sections = @text.split(BREAKPOINT)
      sections.map {|section| convert_to_numbers(section) }.join(',')
    else
      convert_to_numbers(@text)
    end
  end

  private

  def multiple_lines?
    @text.include?(BREAKPOINT)
  end

  def convert_to_numbers(section)
    strings = split_text(section)
    raise ArgumentError if strings.size % 3 != 0
    ocr_numbers = pieces(strings)
    numbers = ocr_numbers.map do |part|
      part = part.scan(/.{3}/).join("\n")
      NUMBERS[part] || '?'
    end

    numbers.join
  end

  def split_text(input)
    input_array = input.scan(/[|_ ]{1,3}/)
    input_array = input_array.map do |number_part|
      number_part.size < 3 ? add_blanks(number_part) : number_part
    end
    input_array.unshift('   ') if input_array.size == 2
    input_array
  end

  def pieces(strings)
    number = strings.size / 3
    numbers = Array.new(number, '')
    strings.each_with_index do |part, idx|
      numbers[idx % number] += part
    end
    numbers
  end

  def add_blanks(value)
    until value.size == 3
      value += ' '
    end
    value
  end
end
