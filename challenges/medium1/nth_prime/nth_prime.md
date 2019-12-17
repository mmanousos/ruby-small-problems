Nth Prime
Write a program that can tell you what the nth prime is.

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

Do not use Ruby's Prime class nor any of the prime-number testing methods in the Integer class. For an algorithm to determine whether a number is prime, check out this article: http://www.counton.org/explorer/primes/checking-if-a-number-is-prime/.

increment primes up to argument n
return that prime

START
  counter increments +2 for each prime.
  when counter == n, return the prime

  divisor: start with 3
  potential prime: start with 3
  get square root of potential prime

  if divisor is > square root of potential prime, number is prime

  divide number by divisor
  if remainder of potential prime / divisor == 0  &&
     potential prime <= divisor, number is prime.


  otherwise, move to next divisor, less than potential prime
  if divisor > potential prime, move to next potential prime and restart divisors at 2
END   

2nd try:
don't hold each prime
counter to increment for each prime
break when counter = number

method to check for prime



Without assigning `nth` as a Class method, get the error:
ThreadError: deadlock; recursive locking
    /Users/mm-mac/.rvm/rubies/ruby-2.6.0-rc1/lib/ruby/2.6.0/singleton.rb:139:in `synchronize'
    /Users/mm-mac/.rvm/rubies/ruby-2.6.0-rc1/lib/ruby/2.6.0/singleton.rb:139:in `instance'
    /Users/mm-mac/.rvm/rubies/ruby-2.6.0-rc1/lib/ruby/2.6.0/forwardable.rb:224:in `new'
    /Users/mm-mac/.rvm/rubies/ruby-2.6.0-rc1/lib/ruby/2.6.0/singleton.rb:141:in `block in instance'
    /Users/mm-mac/.rvm/rubies/ruby-2.6.0-rc1/lib/ruby/2.6.0/singleton.rb:139:in `synchronize'
    /Users/mm-mac/.rvm/rubies/ruby-2.6.0-rc1/lib/ruby/2.6.0/singleton.rb:139:in `instance'
    /Users/mm-mac/.rvm/rubies/ruby-2.6.0-rc1/lib/ruby/2.6.0/forwardable.rb:224:in `nth'
    prime_test.rb:31:in `test_first'
