Robot Simulator
A robot factory's test facility needs a program to verify robot movements.

The robots have three possible movements:

turn right
turn left
advance
Robots are placed on a hypothetical infinite grid, facing a particular direction 
(north, east, south, or west) at a set of {x,y} coordinates, e.g., {3,8}, with 
coordinates increasing to the north and east.

The robot then receives a number of instructions, at which point the testing 
facility verifies the robot's new position, and in which direction it is 
pointing.

The letter-string "RAALAL" means:
Turn right
Advance twice
Turn left
Advance once
Turn left yet again
Say a robot starts at {7, 3} facing north. Then running this stream of 
instructions should leave it at {9, 4} facing west.

Problem

Robot class
methods:
`turn_right` - changes which direction the robot is facing by 90 degrees clockwise (e.g. if facing North, rotates to East)
`turn_left` - changes which direction the robot is facing by 90 degrees counter-clockwise (.e.g if facing North, rotates to West)
`bearing` - return which direction the robot is facing (:north, :south, :east, :west)
`orient` - sets which direction the robot is facing (:north, :south, :east, :west)
`at` - sets coordinates for robot (takes two values for the placement on the grid)
`coordinates` - returns what position on the grid the robot is currently; coordinates are in format: {1, 2} with first value being east/west and second being north/south (positive values = east or north; negative = west or south)
`advance` - moves the robot forward one space (changes current coordinates) depending on which direction its facing

Simulator class
`instructions` - take 'R', 'L', 'A' for right, left, advance (correspond to `turn_right`, `turn_left` and `advance` methods)
`place` - arguments: robot object, coordinates, bearing; sets corresponding instance variables for robot
`evaluate` - arguments: robot object, string of instructions 

Notes: 
- need a data structure to keep track of the order of the directions in relation to one another unless this should be stored in `turn_left` and `turn_right` methods accordingly

- Robot: 
  - need a way to keep track of the current direction (bearing)
  - need a way to keep track of the current position (coordinates)

- argument error for `orient` method if argument is not a symbol representing one of the four directions

- x, y coordinates; x = east/west; y = north/south
