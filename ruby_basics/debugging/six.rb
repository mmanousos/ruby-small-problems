# 6. Confucius Says
=begin
You want to have a small script delivering motivational quotes, but with the following code you run into a very common error message: no implicit conversion of nil into String (TypeError). What is the problem and how can you fix it?
=end
def get_quote(person)
  if person == 'Yoda'
    return 'Do. Or do not. There is no try.'
  end

  if person == 'Confucius'
    return 'I hear and I forget. I see and I remember. I do and I understand.'
  end

  if person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Einstein says:'
puts '"' + get_quote('Einstein') + '"'

# the error has to do with the call of get_quote & it returning nil. This requires an explicit return to get the string back from the first two evaluations.

# this also seems like a perfect implementation for a 'case'

=begin
def get_quote(person)
  case person
		when 'Yoda' 			then 'Do. Or do not. There is no try.'
	  when 'Confucius' 	then 'I hear and I forget. I see and I remember. I do and I understand.'
	  else 'Einstein'				 'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
	end
end

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'
=end
