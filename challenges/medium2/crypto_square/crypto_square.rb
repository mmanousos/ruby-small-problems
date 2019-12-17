class Crypto
  PUNCTUATION = '[.,\/#!$%\^&\*;:{}=\-_`~()]'

  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    text.gsub(/[\s#{PUNCTUATION}]/, '').downcase
  end

  def size
    @size = Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/\w{1,#{size}}/)
  end

  def ciphertext
    create_cipher_components
    cipher_components.join('')
  end

  def normalize_ciphertext
    create_cipher_components
    cipher_components.join(' ').rstrip
  end

  private

  attr_reader :text
  attr_reader :cipher_components

  def create_cipher_components
    substrings = plaintext_segments
    edge = substrings.size
    new_string = ''
    @cipher_components = []
    0.upto(edge) do |number|
      substrings.each do |substring|
        new_string += substring[number] unless substring[number].nil?
      end
      @cipher_components << new_string.dup
      new_string.clear
    end
  end
end
