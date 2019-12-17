Codewars 6 kyu

Enough is enough! (Delete occurrences of an element if it occurs more than n times)

Task
Given a list `lst` and a number `N`, create a new list that contains each number of `lst` at most `N` times without reordering. For example if `N = 2`, and the input is `[1,2,3,1,2,1,2,3]`, you take `[1,2,3,1,2]`, drop the next `[1,2]` since this would lead to 1 and 2 being in the result 3 times, and then take 3, which leads to `[1,2,3,1,2,3]`.

Examples:
delete_nth ([1,1,1,1],2) # return [1,1]
delete_nth ([20,37,20,21],1) # return [20,37,21]

https://www.codewars.com/kata/554ca54ffa7d91b236000023


Mexican Wave
Introduction
 	The wave (known as the Mexican wave in the English-speaking world outside North America) is an example of metachronal rhythm achieved in a packed stadium when successive groups of spectators briefly stand, yell, and raise their arms. Immediately upon stretching to full height, the spectator returns to the usual seated position.
The result is a wave of standing spectators that travels through the crowd, even though individual spectators never move away from their seats. In many large arenas the crowd is seated in a contiguous circuit all the way around the sport field, and so the wave is able to travel continuously around the arena; in discontiguous seating arrangements, the wave can instead reflect back and forth through the crowd. When the gap in seating is narrow, the wave can sometimes pass through it. Usually only one wave crest will be present at any given time in an arena, although simultaneous, counter-rotating waves have been produced. (Source Wikipedia)

Task
 	In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.

Rules
1.  The input string will always be lower case but maybe empty.

2.  If the character in the string is whitespace then pass over it as if it was an empty seat.
Example
wave("hello") => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

https://www.codewars.com/kata/58f5c63f1e26ecda7e000029

Missing Alphabet
In this Kata you have to create a function, named insert_missing_letters, that takes in a string and outputs the same string processed in a particular way.
The function should insert only after the first occurrence of each character of the input string, all the alphabet letters that:
-are NOT in the original string
-come after the letter of the string you are processing

Each added letter should be in uppercase, the letters of the original string will always be in lowercase.

Example:
input: "holly"
missing letters: "a,b,c,d,e,f,g,i,j,k,m,n,p,q,r,s,t,u,v,w,x,z"
output: "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"

You do not need to validate input, the input string will always contain a certain amount of lowercase letters (min 1 / max 50).

https://www.codewars.com/kata/missing-alphabet
