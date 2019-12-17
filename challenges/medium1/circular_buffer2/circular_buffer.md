Circular Buffer
A circular buffer, cyclic buffer or ring buffer is a data structure that uses a single, fixed-size buffer as if it were connected end-to-end.

A circular buffer first starts empty and of some predefined length. For example, this is an empty 7-element buffer:

`[ ][ ][ ][ ][ ][ ][ ]`
Assume that a 1 is written into the middle of the buffer (exact starting location does not matter in a circular buffer):

`[ ][ ][ ][1][ ][ ][ ]`
Then assume that two more elements are added, or written to the buffer — 2 & 3 — which get appended after the 1:

`[ ][ ][ ][1][2][3][ ]`
If two elements are then read, or removed from the buffer, the oldest values inside the buffer are removed. The two elements removed, in this case, are 1 & 2, leaving the buffer with just a 3:

`[ ][ ][ ][ ][ ][3][ ]`
If the buffer has 7 elements then it is completely full:

`[6][7][8][9][3][4][5]`
When the buffer is full an error will be raised, alerting the client that further writes are blocked until a slot becomes free.

The client can opt to overwrite the oldest data with a forced write. In this case, two more elements — A & B — are added and they overwrite the 3 & 4:

`[6][7][8][9][A][B][5]`
Finally, if two elements are now removed then what would be returned is not 3 & 4 but 5 & 6 because A & B overwrote the 3 & the 4 yielding the buffer with:

`[ ][7][8][9][A][B][ ]`
If you need a refresher on how to raise an error, take the time to revisit Launch School's article on Getting Started with Ruby Exceptions: https://launchschool.com/blog/getting-started-with-ruby-exceptions.

Problem
circular buffer with predefined number of data slots
actions:
  write - add to next empty slot(s) in buffer
  read - remove oldest element(s) from buffer and return them
  overwrite - adds new data to overwrite oldest data
  raise error

Example / Tests
`[ ][ ][ ][ ][ ][ ][ ]` - starting buffer
`[ ][ ][ ][1][ ][ ][ ]` - write(1)
`[ ][ ][ ][1][2][3][ ]` - write(2, 3) (arguments are values to be added)
`[ ][ ][ ][ ][ ][3][ ]` - read(2) (argument is # of elements to read)
`[6][7][8][9][3][4][5]` - write('A') - raises error about buffer being full
`[6][7][8][9][A][B][5]` - overwrite('A', 'B') (replaces 3, 4 with A, B; 5, 6 are now the oldest values)
`[ ][7][8][9][A][B][ ]` - read(2) - removes and returns 5, 6 as oldest

Data Structure
empty array
check that array.size is never > 7

Algorithm
BEGIN

SET empty array to hold data

method: write(value)
  raise error if number of values is > 7?
  push value into existing array (adds to end)

method: read
  shift value from front of array

method: overwrite(value)
  read (remove from front)
  write(value) (add to end)
END
