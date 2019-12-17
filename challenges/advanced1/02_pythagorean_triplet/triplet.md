Pythagorean Triplet
A Pythagorean triplet is a set of three natural numbers, {a, b, c}, for which, a**2 + b**2 = c**2.

For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2.

Numbers do not need to be consecutive.

methods:
sum
  in: set of 3 numbers
  out: sum of those 3 numbers
product
  in: set of 3 numbers
  out: product of those 3 numbers
pythagorean?
  in: set of 3 numbers
  out: boolean representation of whether the sum of the squares of the first two numbers equals the square of the third number.

self.where
  in: max_factor, optional - min_factor, sum
  out: array of pythagorean triplets?

  if only max_factor is provided, check triplets from 1 to max
  if min and max factors are provided, check triplets from min to max
  if sum is provided, check triplets from 1 to max where #sum == sum
create Triplet objects from each array of possible values to access the other methods.
