# original solution 
class Cipher
  ALPHABET = [*'a'..'z']
  attr_reader :key

  def initialize(key = generate_key)
    validate_key(key)
    @key = key
  end

  def encode(plaintext)
    characters = plaintext.codepoints.map.with_index do |value, idx|
      wrap_value(value + calculate_distance(idx)).chr
    end
    characters.join
  end

  def decode(ciphertext)
    characters = ciphertext.codepoints.map.with_index do |value, idx|
      wrap_value(value - calculate_distance(idx)).chr
    end
    characters.join
  end

  private

  def validate_key(key)
    error_message = "Key contains unexpected characters - use lowercase letters"
    raise ArgumentError, error_message if key.match(/[^a-z]/) || key.empty?
  end

  def generate_key
    key = ''
    100.times { key += ALPHABET.sample }
    key
  end

  def calculate_distance(index)
    ALPHABET.index(@key[index])
  end

  def wrap_value(value)
    if value < 'a'.ord
      value += 26
    elsif value > 'z'.ord
      value -= 26
    else 
      value 
    end
  end
end

# refactor using #send
class Cipher
  ALPHABET = [*'a'..'z']
  attr_reader :key

  def initialize(key = generate_key)
    validate_key(key)
    @key = key
  end

  def encode(plaintext)
    cipher(plaintext, :+)
  end

  def decode(ciphertext)
    cipher(ciphertext, :-)
  end

  private

  def cipher(string, operation)
    characters = string.codepoints.map.with_index do |value, idx|
      wrap_value(value.send(operation, calculate_distance(idx))).chr
    end
    characters.join
  end

  def validate_key(key)
    error_message = "Key contains unexpected characters - use lowercase letters"
    raise ArgumentError, error_message if key.match(/[^a-z]/) || key.empty?
  end

  def generate_key
    key = ''
    100.times { key += ALPHABET.sample }
    key
  end

  def calculate_distance(index)
    ALPHABET.index(@key[index])
  end

  def wrap_value(value)
    if value < 'a'.ord
      value + 26
    elsif value > 'z'.ord
      value - 26
    else 
      value 
    end
  end
end
