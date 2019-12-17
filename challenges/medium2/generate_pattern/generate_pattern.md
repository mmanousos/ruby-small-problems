generate pattern

in: integer
out: block of numbers and * - 1 star to represent each character

e.g.
generate_pattern(10)

1**********
12*********
123********
1234*******
12345******
123456*****
1234567****
12345678***
123456789**
12345678910

generate an array of the numbers from 1 - integer
generate an array where all are strings
save them as a joined string without spaces
count the total number of characters (x)
iterate through array of strings with index
  join everything from 0 to current
  get length of join
  string = join + '*' * (x - length)
  add to array pattern array  

join pattern array with "\n"
