def invalid_input?(string)
  string.empty? ||
  string.chars.last != '.' ||
  string == '.' ||
  string.split.any?{ |word| word.length > 20 } ||
  string.chars.any?{ |char| char =~ /[?!\[\]()\/\-"'!,*_`~]/ }
end

# Bonus: Examining each character (but not printing out each character).
def odd_words(string)
  return 'invalid input' if invalid_input?(string)

  results = []
  temp_string = ''
  string = string.squeeze(' ').sub(/\s*\./, '.')
  string.chars.each do |char|
    if char.match(/[A-Za-z]/)
      temp_string << char
    elsif char.match(/(\.| )/)
      temp_string = temp_string.reverse if results.size.odd?
      results << temp_string.clone
      temp_string.clear
    end
  end

  results.join(' ') + '.'
end

# Happy path: all with valid input
# def odd_words(string)
#   arr = string.chomp('.').split.map.with_index do |word, idx|
#     idx.odd? ? word.reverse : word
#   end
#   arr.join(' ') + '.'
# end

# Happy path + checking for invalid input
# def odd_words(string)
#   return 'invalid input' if invalid_input?(string)
#   arr = string.chomp('.').split.map.with_index do |word, idx|
#     idx.odd? ? word.reverse : word
#   end
#   arr.join(' ') + '.'
# end

p odd_words('') == 'invalid input'
p odd_words('.') == 'invalid input'
p odd_words('antiferromagnetically invalid.') == 'invalid input'
p odd_words('who are you?') == 'invalid input'
p odd_words("that's a fact.") == 'invalid input'
p odd_words("whats the matter with kansas.") == "whats eht matter htiw kansas."
p odd_words("whats  the matter with kansas.") == "whats eht matter htiw kansas."
p odd_words('why are we in this place.') == 'why era we ni this ecalp.'
p odd_words('why are we in this place  .') == 'why era we ni this ecalp.'
p odd_words('who are you.') == 'who era you.'
