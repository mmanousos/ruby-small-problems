require 'minitest/autorun'
require 'minitest/pride'

class TestCase < Minitest::Test
  def sort_by_value_and_index(arr)
    new_arr = arr.map.with_index { |n, idx| [n*(idx + 1), idx] }
    new_arr.sort! { |a, b| a.first <=> b.first }
    new_arr.map { |ary| ary.first/(ary.last + 1) }
  end

  def test_1
    assert_equal(sort_by_value_and_index([ 23, 2, 3, 4, 5 ]), [ 2, 3, 4, 23, 5 ])
  end
end

*Level 7*
Good luck Coop(updated)!
Your aim in this puzzle will be to help agent Cooper to avoid the evil powers.

How can you help?

You, as agent Gordon, can see the board and you have directions from FBI and directions from FBI are always safest. What you can do is to check the board for agent Coop and text him the only safe route he has to take.

** Cooper can take only horizontal or vertical gate.

** Gates numbering starts from one.

look at the actual example:

If your directions from FBI is "abcdd" and your board is:

   "abcdd",            a b c d d
   "12345",            1 2 3 4 5
   "ratca",     =>     r a t c a
   "pimmu",            p i m m u
   "rest1"             r e s t 1
it is obvious that you have to send a massage to Coop that says: "Horizontal 1", so he can take the safe route.
another example: if we have the same board and your direction is "c3tms" your message has to be "Vertical 3!" because it matches 3rd vertical line;
If the directions are too short or too long or do not match any horizontal or vertical line you have to text agent Cooper: "Coop, it's too risky!".

** Board is always square and length of the direction might not match the length of the square
** Password and board subarrays are always provided as lowerCase strings
** Function has to return a string

*Level 7*
Digital Cypher
Introduction
Digital Cypher assigns to each letter of the alphabet unique number. For example:

 a  b  c  d  e  f  g  h  i  j  k  l  m
 1  2  3  4  5  6  7  8  9 10 11 12 13
 n  o  p  q  r  s  t  u  v  w  x  y  z
14 15 16 17 18 19 20 21 22 23 24 25 26
Instead of letters in encrypted word we write the corresponding number, eg. The word scout:

 s  c  o  u  t
19  3 15 21 20
Then we add to each obtained digit consecutive digits from the key. For example. In case of key equal to 1939 :

   s  c  o  u  t
  19  3 15 21 20
 + 1  9  3  9  1
 ---------------
  20 12 18 30 21

   m  a  s  t  e  r  p  i  e  c  e
  13  1 19 20  5 18 16  9  5  3  5
+  1  9  3  9  1  9  3  9  1  9  3
  --------------------------------
  14 10 22 29  6 27 19 18  6  12 8
Task
Write a function that accepts str string and key number and returns an array of integers representing encoded str.

Input / Output
The str input string consists of lowercase characters only.
The key input number is a positive integer.

Example
Encode("scout",1939);  ==>  [ 20, 12, 18, 30, 21]
Encode("masterpiece",1939);  ==>  [ 14, 10, 22, 29, 6, 27, 19, 18, 6, 12, 8]

*Level 7*
Predict Your Age
My grandfather always predicted how old people would get, and right before he passed away he revealed his secret!

In honor of my grandfather we will write a function using his formula!

Take a list of ages when each of your great-grandparent died.
Multiply each number by itself.
Add them all together.
Take the square root of the result.
Divide by two.
Example:
predict_age(65, 60, 75, 55, 60, 63, 64, 45) == 86
Note: the result should be rounded down to the nearest integer.

*Level 6*
Tortoise Racing
Two tortoises named A and B must run a race. A starts with an average speed of 720 feet per hour. Young B knows she runs faster than A, and furthermore has not finished her cabbage.

When she starts, at last, she can see that A has a 70 feet lead but B travels feet per hour. How long will it take B to catch A?

More generally: given two speeds v1 (speed of A, integer > 0) and v2 (speed of B, integer > 0) and a lead g (integer > 0) how long will it take B to catch A?

The result will be an array [hour, min, sec] which is the time needed in hours, minutes and seconds (round down to the nearest second) or a string in some languages.

If v1 >= v2 then return nil.

Examples:
p race(720, 850, 70) == [0, 32, 18]
p race(80, 91, 37)   == [3, 21, 49]
https://www.codewars.com/kata/tortoise-racing

*Level 6*
Missing Alphabet
In this Kata you have to create a function,named insertMissingLetters,that takes in a string and outputs the same string processed in a particular way.

The function should insert only after the first occurence of each character of the input string, all the alphabet letters that:

-are NOT in the original string
-come after the letter of the string you are processing

Each added letter should be in uppercase, the letters of the original string will always be in lowercase.

Example:
input: "holly"
missing letters: "a,b,c,d,e,f,g,i,j,k,m,n,p,q,r,s,t,u,v,w,x,z"
output: "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"

You do not need to validate input, the input string will always contain a certain amount of lowercase letters (min 1 / max 50).
https://www.codewars.com/kata/missing-alphabet

*Level 6*
Sum of Two Integers
Task
Given Two intgers a, b, find The sum of them, BUT You are not allowed to use the operators + and -

Notes
The numbers (a,b) may be positive, negative values or zeros.

Returning value will be integer.

Input >> Output Examples
Add (5,19) ==> return (24)
Add (-27,18) ==> return (-9)
Add (-14,-16) ==> return (-30)
https://www.codewars.com/kata/sum-of-two-integers

*Level 6*
Warm Up for Speed
The digit root of a number (dr) is the sum of the digits of a number. For example, the integer 749, has a digit root equals to 20.

In effect: 7 + 4 + 9 = 20.

We define here the deeper square double digit root of an integer n, (dsddr), the sum of the squares of every digit of the digit root of n.

The dsddr of 749 will be 4: 22 + 02 = 4

We define the function f, like:

f(n) = dr(n) + dsddr(n)
Now we receive two arrays of positive integers, arr1 , arr2 of different lengths. They have common elements. The task is to output an array, res, with the common elements occurring once and sorted by their corresponding value of f in descending order. If there is a coincidence in the value of f(res[i]), the lowest number goes first.

Example:
arr1 = [5, 56, 28, 35, 12, 27, 64, 99, 18, 31, 14, 6]
arr2 = [28, 17, 31, 63, 64, 5, 18, 17, 95, 56, 37, 5, 28, 16]
The common elements of arr1 and arr2 are: [64, 5, 18, 56, 28, 31]

The table for their corresponding value of f is:
n        f(n)
64        11
 5        30
18        90
56        13
28        11
31        20
So the output will be: [18, 5, 31, 56, 28, 64]

You do not have to worry about the inputs, arr1 and arr2, will be always valid arrays and all of their terms, positive integers.

Features of the random tests:
lengths of arrays for the input up to 500.000.
The values of the integers between 1 and 1.500.000
Amount of tests almost 150

*Level 6*
Jewel Thief
Story
The word is on the street that you claim to be a safe-cracking jewel thief.
But are you?
This Kata will verify your safe-cracking abilities.

Kata
To prove you are a real thief you need to crack the combination of the safe, and then open it and tell me the value of the jewels inside!

The safe object has two methods:

Method	 Parameter	  Returns
                      Type	   Meaning
unlock   combination	string	 Sounds you can hear
                               No Sound
                               click	            The first part of the combination is correct
                               click-click	      The first two parts of the combination are correct
                               click-click-click	The combination is correct.
                                                  Now you can turn the handle to open the safe.

open      -	          integer  The value of the safe contents (range 0 - 100,000)

Combination Format
The safe combination is made up of 3 dial spins.
Spin the dial left L or right R
Numbers on the dial 00 - 99
Each part of the combination is separated by -
e.g. L23-R67-R09
https://www.codewars.com/kata/jewel-thief

*Level 6*
Mexican Wave
Introduction
The wave (known as the Mexican wave in the English-speaking world outside North America) is an example of metachronal rhythm achieved in a packed stadium when successive groups of spectators briefly stand, yell, and raise their arms. Immediately upon stretching to full height, the spectator returns to the usual seated position. The result is a wave of standing spectators that travels through the crowd, even though individual spectators never move away from their seats. In many large arenas the crowd is seated in a contiguous circuit all the way around the sport field, and so the wave is able to travel continuously around the arena; in discontiguous seating arrangements, the wave can instead reflect back and forth through the crowd. When the gap in seating is narrow, the wave can sometimes pass through it. Usually only one wave crest will be present at any given time in an arena, although simultaneous, counter-rotating waves have been produced. (Source Wikipedia)

Task
In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.

Rules
1.  The input string will always be lower case but maybe empty.
2.  If the character in the string is whitespace then pass over it as if it was an empty seat.

Example
wave("hello") => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
https://www.codewars.com/kata/mexican-wave
