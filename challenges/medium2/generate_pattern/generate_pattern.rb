def generate_pattern(number)
  number_strings = (1..number).to_a.map(&:to_s)
  string_length = number_strings.join.length
  pattern = []

  number_strings.each_with_index do |string, index|
    current = number_strings[0..index].join
    current_length = current.length
    pattern << current + '*' * (string_length - current_length)
  end

  pattern.join("\n")
end

puts generate_pattern(20)
