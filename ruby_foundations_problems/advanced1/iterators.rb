=begin
Internal vs External Iterators
This exercise covers material that you do not have to master. We provide the
exercise as a way to demonstrate how Enumerator objects work.

So far, we've used iterators often. You've seen the use of `#each` and `#map`
used on various data structures, such as Arrays and Hashes. These methods make
writing certain code a bit easier, at least when compared to a `while` or `for`
loop. Yet, what we've seen thus far is only part of what is available.

Whenever we use `map` or `each` on something like an Array, we're using
something called "Internal Iteration". It's called that because the process and
implementation of that iteration is hidden from us, and the process that allows
us to progress through a collection is part of that hidden implementation.

There's also "External Iteration". This is iteration that takes place at the
behest of the user. Ruby gives us the option to use this type of iteration
with the `Enumerator` class. For this exercise, let's take a bit of a tour of
the capabilities of `Enumerator`. While we do that, let's make something
interesting with it.

In this exercise, your task is to create a new Enumerator object. When
creating a new Enumerator, you may define what values are iterated upon.
We'll want to create an Enumerator that can iterate over an infinite list of
factorials. Once you make this new Enumerator, test it out by printing out the
first 7 factorial values, starting with zero factorial.

More specifically, print the first 7 factorials by using an "External Iterator".
Once you have done so, reset your Enumerator. Finally, reprint those same 7
factorials using your Enumerator object as an "Internal Iterator".

You can find almost everything you need for this exercise in the documentation
for Enumerator (https://ruby-doc.org/core/Enumerator.html). In particular,
check out the `::new` method; it should prove a good starting point for this
exercise. Some further details about internal vs external iterators are
mentioned at the start of that documentation, so make sure to read that section.
Keep in mind that that section can be a bit dense; if you don't understand
everything about it, that's ok.

The wikipedia page on factorials (https://en.wikipedia.org/wiki/Factorial)
may also be of some use.
=> n mathematics, the factorial of a non-negative integer n, denoted by n!, is
the product of all positive integers less than or equal to n. For example,

5! = 5 * 4 * 3 * 2 * 1 = 120
5 * 4 = 20
20 * 3 = 60
60 * 2 = 120
120 * 1 = 120

Two final hints:

You'll only need 3 Enumerator methods to complete this exercise.
An Enumerator also implements the Enumerable module. Keep this in mind, as it
may make certain parts of this exercise easier to write.
=end

=begin
Problem
Create a new Enumerator object. Define what values are iterated upon.
Iterate over an infinite list of factorials.

- Print out the first seven factorials, starting with zero factorial, using an
"external iterator" - where the user dictates the iteration that happens.

- Reset Enumerator
- Reprint same seven factorials using Enumerator object as an "Internal
Iterator", like `map` or `each` where the process is hidden from the user.

Example / Tests

factorial(7)
0 # => 1
1 # => 1
2 # => 2
3 # => 6
4 # => 24
5 # => 120
6 # => 720
7 # => 5040

Data Structure

Algorithm
  BEGIN


    reduce(0) do |product, value|
      product * value
      puts "factorial of #{value} is #{product}"
    end
  END
=end

# only satisfies second part of assignment - iterating internally - and does
# not allow for external iteration.
# number = 7
# factorial = [*0..number].each
#
# factorial.reduce do |product, value|
#   result = product.zero? ? (product + 1) : (product)
#   puts "factorial of #{value - 1} is #{result}"
#   product.zero? ? product = 1 : product * value
# end

# my version of Course Solution
factorial = Enumerator.new do |yielder| # assign new local variable to reference enumerator
                                        # enumerator object contains a block, with parameter of "yielder"
  result = 1                            # our result will start equal to 1
  number = 0                            # the number we are iterating to starts equal to zero
  loop do                               # start a loop
    result = number.zero? ? 1 : (number * result) # reassign result variable to either 1 or the product of number * result (our factorial)
    yielder << result                   # we yield this new result value to the yielder object
    number += 1                         # and increment to the next value we are iterating over
  end
end
# this entire process is basically the plain `loop` system of what `Enumerable#reduce` does, but allows for it being called generically

7.times { |value| puts "The factorial of #{value} is #{factorial.next}." }

factorial.rewind

factorial.each_with_index do |number, index|
  puts "The factorial of #{index} is #{number}."
  break if index == 6
end
