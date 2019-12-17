Robot Name
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time you boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask, it will respond with a new random name.

The names must be random: they should not follow a predictable sequence. Random names means a risk of collisions. Your solution should not allow the use of the same name twice when avoidable.

Random name generator.
`reset` method clears current name and generates a new name
`initialize` calls the `name_generator` method
`name` returns their name

name consists of two uppercase letters and three numbers

robot object
in: none
out:
- robot object with a name attribute
- reset functionality
- name_generator functionality

LETTERS = [*"A".."Z"].freeze
NUMBERS = [*0..9].freeze

name_generator
  pull two random values from LETTERS and three random values from NUMBERS
  join to a single string

reset
  clear name
