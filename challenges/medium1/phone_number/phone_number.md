Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages.

The rules are as follows:

If the phone number is less than 10 digits assume that it is bad number
If the phone number is 10 digits assume that it is good
If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits
If the phone number is 11 digits and the first number is not 1, then it is a bad number
If the phone number is more than 11 digits assume that it is a bad number

input: user-entered data (string - may contain letters, integers, punctuation)
output: string of 10 consecutive digits

strip out any non-number values (punctuation or letters)

break clauses for numbers longer than 11 and shorter than 10. (#length)
  - replace with '0000000000'
if 11, check first number
  - if not 1, replace with '0000000000'
  - if 1, strip and use 10 digits

BEGIN
  SET default_number = '0000000000'

  define method invalid_length?(number.length)
    number.length > 11 || number.length < 10
  end

  define method first_digit_check(number)
    first = number[0]
    first != '1' ? default_number : number[1..-1]
  end

  SET data = argument
  data substitute any non-digit characters with ''

  number_length = data.length
  return default_number if invalid_length?(number_length)
  data = first_digit_check if number_length = 11

  return data  
END  

Second attempt
strip punctuation and check length before stripping letters & checking length again.

  SET default_number = '0000000000'

  SET data = argument
  strip punctuation (non letter or digit)
  return default_number if length > 11 || length < 10
  strip letters (non digit)
  return default_number if length > 11 || length < 10
  check first digit of 11-digit numbers for 1 / not 1 (strip 1)
  return number

area code
 breaks first 3 digits and returns

to_s
  returns area code wrapped in parens, space, next 3 digits, dash, final 4
  use format (fprint)
