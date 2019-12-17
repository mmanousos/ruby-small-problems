def crunch(str)
  no_rpt_chars = ''

  # Uses Regexp to identify one or more of a character
  str.scan(/(.)\1*/) { |w| no_rpt_chars << w[0] }

  no_rpt_chars
end

p crunch('ddaaiillyy ddoouubbllee') # == 'daily double'
p crunch('4444abcabccba') # == '4abcabcba'
p crunch('ggggggggggggggg') # == 'g'
p crunch('a') # == 'a'
p crunch('') # == ''
