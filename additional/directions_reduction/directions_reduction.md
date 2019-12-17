Directions Reduction
https://www.codewars.com/kata/550f22f4d758534c1100025a

Once upon a time, on a way through the old wild west,…
… a man was given directions to go from one point to another. The directions were "NORTH", "SOUTH", "WEST", "EAST". Clearly "NORTH" and "SOUTH" are opposite, "WEST" and "EAST" too. Going to one direction and coming back the opposite direction is a needless effort. Since this is the wild west, with dreadfull weather and not much water, it's important to save yourself some energy, otherwise you might die of thirst!

How I crossed the desert the smart way.
The directions given to the man are, for example, the following (depending on the language):

["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"].
or

{ "NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST" };
or

[North, South, South, East, West, North, West]
You can immediatly see that going "NORTH" and then "SOUTH" is not reasonable, better stay to the same place! So the task is to give to the man a simplified version of the plan. A better plan in this case is simply:

["WEST"]
or

{ "WEST" }
or

[West]
Other examples:
In ["NORTH", "SOUTH", "EAST", "WEST"], the direction "NORTH" + "SOUTH" is going north and coming back right away. What a waste of time! Better to do nothing.

The path becomes ["EAST", "WEST"], now "EAST" and "WEST" annihilate each other, therefore, the final result is [] (nil in Clojure).

In ["NORTH", "EAST", "WEST", "SOUTH", "WEST", "WEST"], "NORTH" and "SOUTH" are not directly opposite but they become directly opposite after the reduction of "EAST" and "WEST" so the whole path is reducible to ["WEST", "WEST"].

Task
Write a function dirReduc which will take an array of strings and returns an array of strings with the needless directions removed (W<->E or S<->N side by side).

The Haskell version takes a list of directions with data Direction = North | East | West | South.
The Clojure version returns nil when the path is reduced to nothing.
The Rust version takes a slice of enum Direction {NORTH, SOUTH, EAST, WEST}.
See more examples in "Sample Tests:"
Notes
Not all paths can be made simpler. The path ["NORTH", "WEST", "SOUTH", "EAST"] is not reducible. "NORTH" and "WEST", "WEST" and "SOUTH", "SOUTH" and "EAST" are not directly opposite of each other and can't become such. Hence the result path is itself : ["NORTH", "WEST", "SOUTH", "EAST"].

Problem
In: array of directions (north, south, east, west) some of which may be in direct opposition
Out: reduced array of directions - removing any which are in direct opposition

Rules: directions can only be reduced if they are directly in opposition to each other
Notes: 
Assumptions: 
- input array will only contain the four directional terms
- directional terms will all be uppercase

Approach Brainstorming: 
create data structure to hold opposite directions: hash/object or nested array 
must contain both variations of the pairs ('NORTH' 'SOUTH' and 'SOUTH' 'NORTH')

Approach 1
create new array to hold non-paired directions
iterate over directions array starting at position 1
  if element before it is the current direction's opposite
    do not include previous or current in the new array
    if it is opposite, delete both elements (previous and current)

Approach 2
triple loop?
outer: until direction array does not contain any pairs
middle: iterate over data structure of pairs 
inner:  iterate over direction array
          if the first element of the pair is encountered, 
            check if the following element is the other element of the pair
            if so, delete both from the array (and start over?)
        continue until all elements are checked against that pair  

Approach 3
create new array to hold reduced directions
SET continue that indicates if there are pairs to TRUE
while continue == TRUE
  iterate over directions array with index, starting at index 1
    if direction at current element index - 1 is the pair for current element
      next
    else 
      add previous element to reduced directions
set reduced to current and repeat

Approach 4
create a copy of the argument directions array
SET continue that indicates if there are pairs to TRUE
while continue == TRUE
  iterate over directions array with index, starting at index 1
    if direction at current element index - 1 is the pair for current element
      set both values to nil
      next

if copy array doesn't contain any nil values
  set continue to false
else 
  set copy of directions array to current copy minus any nil values and repeat


Example / Tests 
["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"] => ["WEST"]
["NORTH", "SOUTH", "EAST", "WEST"] => ["NORTH", "SOUTH", "EAST", "WEST"]
["NORTH", "EAST", "WEST", "SOUTH", "WEST", "WEST"] => ["WEST", "WEST"]

Data Structure 
Hash / Object for directional pairs

Algorithm
BEGIN
  PAIRS = { "NORTH": "SOUTH", "EAST": "WEST" }
  SET dirs_copy = directions
  SET reduced = []
  SET continue = true

  WHILE (continue)
    iterate over dirs_copy with index
      SET previous = dirs_copy[index - 1]
      IF previous is equal to PAIRS[current] ||
      if previous is equal to PAIRS.key(current) 
        continue = true
        next
      ELSE
        reduced << previous
      END 
    END  
    
    IF dirs_copy == reduced
      continue = false
    ELSE
      continue = true      
      dirs_copy = reduced
    END
  END  
END