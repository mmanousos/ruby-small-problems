str = File.read('speech.yml')

break_chars = ['!', '?', '.']

sentence_arr = []
longest = ''
longest_words = 0
break_point = 0

str.each_char.with_index do |ltr, idx|
  if break_chars.include?(ltr)
    sentence_arr << str.slice(break_point..idx)
    break_point = idx + 2
  end
end

sentence_arr.each do |sentence|
  sentence_length = sentence.split.size
  if sentence_length > longest_words
    longest = sentence
    longest_words = sentence_length
  end
end

puts "The longest sentence in the text is: '#{longest}'. It is #{longest_words} words long."
