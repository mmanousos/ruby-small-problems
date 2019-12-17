# 2. Quote Confusion
=begin Modify the following code so that double-quotes are used instead of single-quotes.

	puts 'It\'s now 12 o\'clock.'

Expected output:

	It's now 12 o'clock.

=end

puts "It\'s now 12 o\'clock."


# Further Exploration
=begin
It's possible to write a string without surrounding it with double- or single-quotes. Instead of using double-quotes, we could write the example string like this:

%Q(It's now 12 o'clock.) # => "It's now 12 o'clock."
%Q is an alternative to double-quoted strings. There's also an alternative for single-quoted strings: %q.

What about strings that contain double- and single-quotes? How would you write those using the alternate syntax?

# doesn't work: p %Q(My new business card reads %q(Melissa Manousos).)
# doesn't work: p %Q(My new business card reads ) + %q(Melissa Manousos) + %Q(.)
# works: p %Q(My new business card reads 'Melissa Manousos'.)
not sure if there is a better way to combine the two using both versions of the alternate syntax.  

=end
