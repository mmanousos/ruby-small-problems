Roman Numerals
The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis. One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these letters have lots of straight lines and are hence easy to hack into stone tablets).

 1  => I
10  => X
 7  => VII
There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

To see this in practice, consider the example of 1990.

In Roman numerals 1990 is MCMXC:
1000=M
900=CM
90=XC

2008 is written as MMVIII:
2000=MM
8=VIII

4=IV
9=IX
70=LXX

See also: http://www.novaroma.org/via_romana/numbers.html


in: decimal
out: roman numeral as string

Roman Numerals: I, V, X, L, C, D, M
Correspond to: 1, 5, 10, 50, 100, 500, 1000
* Disregard values over 3000 or below 1.

AL:
version 1
break number into array of digits
  use divmod to figure out how many of each value are present
  count # of digits
  divmod repeatedly until build out hash:
    start with 1000
    to 100
    to 10
    to 1
    hash builds: { 1000 => w, 100 => x, 10 => y, 1 => z}
iterate through hash building strings of numerals:
  get value of hash,


version 2
break number into an array of digits
(digits will be in reverse order)
iterate over array of digits based on index number (ones up to thousands)
map digit to numeral
  calculate numeral
reverse array
join string and return

version 3
break number into hash of digits: decimal place => quantity
iterate over hash, check quantity
  next if 0
  calculate numeral from lookup table (nested array) of values & their roman numeral counterparts.


version 4
number = calling integer
SET result empty array for return value
iterate over lookup table of numerals: pairs of values & numerals
* get digits of current value - 1
* if digits is > 1, use to divide test before evaluating
  test = number/digits -= value/digits
  next IF test is <= -2
  if test == -1
    create new string
    add numeral to string
    number = |test|
      locate pair for number & add that numeral in front of the other numeral in string    
  else
    push numeral to result
    number -= number - value
  end
join result and return

9 - 10 = -1
X


40

ROMAN_NUMERALS = { 1000 => 'M', 500 => 'D', 100 => 'C',
                   50 => 'L', 10 => 'X', 5 => 'V', 1 => 'I'}

ROMAN_NUMERALS = [ [1000, 'M'], [500, 'D'], [100, 'C'],             
                   [50, 'L'], [10, 'X'], [5, 'V'], [1, 'I'] ]

ROMAN_NUMERALS = { 1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L',
                   100 => 'C', 500 => 'D', 1000 => 'M' }

ROMAN_NUMERALS = [ [1, 'I'], [5, 'V'], [10, 'X'], [50, 'L'],
                   [100, 'C'], [500, 'D'], [1000, 'M'] ]


VALUE = { 1000 => 2, 100 => 0, 10 => 0, 1 => 0 }
VALUE = { 1000 => 0, 100 => 5, 10 => 0, 1 => 0 }

p numeral = "#{ROMAN_NUMERALS[1000]}" * VALUE[1000]

if value of 1, 10, or 100 == 4, current + next value (works better with array.)
if value of 1, 10, or 100 == 5, get next value
if value of 1, 10, or 100 == 9, current + 2 over

roman = ''
VALUE.each_pair { |digit, quantity|
  digit
  }

p numeral = "#{ROMAN_NUMERALS[1000]}" * VALUE[1000]
