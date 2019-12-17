=begin
*assignment*
1000 Lights
You have a bank of switches before you, numbered from 1 to n. Each switch is
connected to exactly one light that is initially off. You walk down the row of
switches and toggle every one of them. You go back to the beginning, and on this
second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go
back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat
this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and
returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:
round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4.
The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9.
The return value is [1, 4, 9].

*problem*
input: integer n representing the number of light switches
output: array representing which lights are on after n repetitions of toggling

use Integer#upto for correct number of loop iterations

1st pass = toggle all on
2nd pass = toggle multiples of 2 (evens are now off - 2, 4; odds are still on - 1, 3, 5)
3rd pass = toggle multiples of 3 (3 is now off; 2 & 4 remain off; 1 & 5 remain on)
4th pass = toggle multiples of 4 (4 switches back on; 2 & 3 remain off; 1 & 5 remain on)
5th pass = toggle multiples of 5 (5 switches off; 2 & 3 remain off; 1 & 4 remain on)

*examples / test cases *
toggle_lights(5) == [1, 4]
toggle_lights(10) == [1, 4, 9]

*data structures*
intger to single array

*algorithm*
BEGIN
  declare a method that takes one integer 'num' as an argument
    SET lights_arr = []
    WHILE lights_arr.size < num
      push false into lights_arr
    SET counter = 0
    WHILE counter <= num
      access each element with index of lights_arr
      IF index + 1 % counter == 0
        toggle element to !element
        increment counter += 1
      end
    end

    SET positions_of_trues = map true values to index number + 1
    PRINT true_values = select values != false
END
=end

def toggle_lights(num)
  lights = []
  1.upto(num) do
    lights << false
  end
  counter = 1
  while counter <= num
    lights = lights.map.with_index do |val, idx|
      (idx + 1) % counter == 0 ? !val : val
    end
    counter += 1
  end
  lights.map.with_index { |val, idx| idx + 1 if val == true }.select { |val| val != nil }
end

# Course Solution - utilizes several helper methods to compartmentalize
# functionality

# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(2) == [1]
p toggle_lights(5) == [1, 4]
p toggle_lights(10) == [1, 4, 9]
p toggle_lights(100) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
p toggle_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

# Further Exploration
=begin
There are a few interesting points about this exercise that we can explore:

1. Do you notice the pattern in our answer? Every light that is on is a perfect
square. Why is that?
2. What are some alternatives for solving this exercise? What if we used an
Array to represent our 1000 lights instead of a Hash, how would that change our
code?
3. We could have a method that replicates the output from the description of
this problem (i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.") How would
we go about writing that code?
=end
1. another student created a grid that demonstrates that only the perfect
squares are toggled an even number of times so remain on as the final result.
Similar to that student, I am not sure what mathematical principle causes that.
2. My solution used an array. It required me to add 1 to the index of each true
value when determining the correct number value to return.
I considered using a hash of arrays with the keys true: and false: or on: and
off: but that would have required mutating the array as it was interated over to
move values between each array appropriately.
I also considered creating a hash to hold a key-value pair for each number and
its current state (as the Course Solution does) seemed like overkill. Of course
it does make accessing each number more straight forward than the array I used.
3.

def print_answer(array)
  case array.size
  when 1
    "#{array[0]} is"
  when 2
    "#{array[0]} and #{array[1]} are"
  when 3..10000
    subarray = array[0...-2]
    "#{subarray.join(', ')}, #{array[-2]}, and #{array[-1]} are"
  end
end

def toggle_lights(num)
  lights = []
  1.upto(num) do
    lights << false
  end
  counter = 1
  while counter <= num
    lights = lights.map.with_index do |val, idx|
      (idx + 1) % counter == 0 ? !val : val
    end
    counter += 1
  end
  lights_on = lights.map.with_index { |val, idx| idx + 1 if val == true }
  lights_on = lights_on.select { |val| val != nil }
  lights_off = lights.map.with_index { |val, idx| idx + 1 if val == false }
  lights_off = lights_off.select { |val| val != nil }

  puts "Lights #{print_answer(lights_off)} now off; #{print_answer(lights_on)} on."
end
toggle_lights(2)
toggle_lights(5)
toggle_lights(10)
toggle_lights(100)
