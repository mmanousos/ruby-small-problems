=begin
*assignment*
Welcome Stranger
Create a method that takes 2 arguments, an array and a hash. The array will
contain 2 or more elements that, when combined with adjoining spaces, will
produce a person's name. The hash will contain two keys, :title and :occupation,
and the appropriate values. Your method should return a greeting that uses the
person's full name, and mentions the person's title.

Example:
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.

*problem*
input: array and hash both containing strings
output: String that combines all values from the array to greet the person by
their full name and mentions their title.

Concatenation / Interpolation

*examples / test cases *
see above

*data structures*
array and hash to string

*algorithm*
BEGIN
  declare a method that takes an array and a hash as arguments
    SET name = joined array values with space as delimiter
    SET title_job = concatenated title and occupation values from hash
    PRINT string with name and title_job interpolated
END
=end

def greetings(arr, hsh)
  name = arr.join(' ')
  title_job = "#{hsh[:title]} #{hsh[:occupation]}"
  puts "Pleasure to have you #{name}. I don't think I've ever met a #{title_job} before!"
end

# Course Solution - uses all interpolation, no additional variable assignments
def greetings(name, status)
  "Hello, #{name.join(' ')}! Nice to have a #{status[:title]} #{status[:occupation]} around."
end

# Further Exploration
# This method doesn't actually pass rubocop! What is the best way to shorten the
# lines in this method so it doesn't exceed the 80 maximum characters to a line?

# rubocop isn't keen on interpolation in general. But for this, splitting lines
# and using a \ operator works well.
def greetings(arr, hsh)
  name = arr.join(' ')
  title_job = "#{hsh[:title]} #{hsh[:occupation]}"
  puts "Pleasure to have you #{name}. I don't think I've ever met a " \
       "#{title_job} before!"
end

# Rubocop prefers using single quotes. This solution satisfies that format.
def greetings(arr, hsh)
  name = arr.join(' ')
  title_job = "#{hsh[:title]} #{hsh[:occupation]}"
  puts 'Pleasure to have you ' + name + ". I don't think I've ever met a " + \
       title_job + ' before!'
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
