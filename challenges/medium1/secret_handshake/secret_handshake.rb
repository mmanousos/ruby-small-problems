class InvalidInputError < ArgumentError
  def initialize(msg = 'Input must be string or integer')
    super
  end
end

class SecretHandshake
  VALID_BINARY = /(0|1)/
  EVENTS = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(value)
    cls = value.class
    raise InvalidInputError unless valid_input_type?(cls)
    @value = if cls == String && !valid_binary?(value)
               '0'
             elsif cls == String
               value
             else
               convert_to_binary(value)
             end
  end

  def commands
    results = EVENTS.select.with_index.with_object([]) do |(event, idx), array|
      array << event if @value.reverse[idx] == '1'
    end
    @value.length >= 5 ? results.reverse : results
  end

  private

  def valid_input_type?(input)
    input == String || input == Integer
  end

  def valid_binary?(string)
    string.chars.all? { |digit| digit =~ VALID_BINARY }
  end

  def convert_to_binary(number)
    number.to_s(2)
  end
end
