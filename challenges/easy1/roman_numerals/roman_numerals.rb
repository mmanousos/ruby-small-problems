# without hardcoding all of the possible values -
# very hard to read & requires a lot of complicated jumping through the values
class Integer
  ROMAN_NUMERALS = [ [1, 'I'], [5, 'V'], [10, 'X'], [50, 'L'],
                     [100, 'C'], [500, 'D'], [1000, 'M'] ]

  def get_numerals(quantity, digit)
    roman_num_idx = 0
    ROMAN_NUMERALS.each_with_index do |subarray, idx|
      roman_num_idx = idx if subarray[0] == digit
    end

    if quantity <= 3
      ROMAN_NUMERALS[roman_num_idx][1] * quantity
    elsif quantity == 4
      ROMAN_NUMERALS[roman_num_idx][1] +
      ROMAN_NUMERALS[roman_num_idx + 1][1]
    elsif quantity == 5
      ROMAN_NUMERALS[roman_num_idx + 1][1]
    elsif quantity > 5 && quantity < 9
      quantity -= 5
      ROMAN_NUMERALS[roman_num_idx + 1][1] +
      ROMAN_NUMERALS[roman_num_idx][1] * quantity
    else
      ROMAN_NUMERALS[roman_num_idx][1] +
      ROMAN_NUMERALS[roman_num_idx + 2][1]
    end
  end

  def split_number
    value = 1000
    digits = {}
    number = self
    while number > 0
      quantity, remainder = number.divmod(value)
      digits[value] = quantity
      number = remainder
      value = value / 10
    end
    digits
  end

  def to_roman
    roman = ''
    value = self.split_number
    value.each_pair do |digit, quantity|
      next if quantity == 0
      roman << get_numerals(quantity, digit)
    end
    roman
  end
end

# much easier to read when hardcoding all of the values
class Integer
  ROMAN_NUMERALS = { 1000 => 'M',
                      900 => 'CM',
                      500 => 'D',
                      400 => 'CD',
                      100 => 'C',
                       90 => 'XC',
                       50 => 'L',
                       40 => 'XL',
                       10 => 'X',
                        9 => 'IX',
                        5 => 'V',
                        4 => 'IV',
                        1 => 'I' }

  def to_roman
    numeral = ''
    number = self
    ROMAN_NUMERALS.each_pair do |value, letter|
      number_of_numerals, number / value
      numeral += letter * number_of_numerals
      number -= number_of_numerals * value
    end
    numeral
  end
end
