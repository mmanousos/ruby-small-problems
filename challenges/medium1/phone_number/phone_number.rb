class PhoneNumber
  DEFAULT_NUMBER = '0000000000'
  attr_accessor :number

  def initialize(data)
    @number = validate(strip_punctuation(data))
  end

  def area_code
    number[0..2]
  end

  def to_s
    number.gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  end

  private

  def validate(value)
    return DEFAULT_NUMBER if invalid_length?(value.length)

    value = strip_non_numbers(value)
    case value.length
    when 11 then first_digit_check(value)
    when 10 then value
    else         DEFAULT_NUMBER
    end
  end

  def strip_punctuation(value)
    value.gsub(/[^A-Za-z\d]/, '')
  end

  def strip_non_numbers(value)
    value.gsub(/[\D]/, '')
  end

  def invalid_length?(value)
    value > 11 || value < 10
  end

  def first_digit_check(value)
    value[0] != '1' ? DEFAULT_NUMBER : value[1..-1]
  end
end
