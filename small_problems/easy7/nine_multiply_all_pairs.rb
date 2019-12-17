=begin
*assignment*
Multiply All Pairs
Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of every pair
of numbers that can be formed between the elements of the two Arrays. The
results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

Examples:
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

*problem*
input: two arrays of integers
output: single array of all of the multiples that can be formed between the two
arrays, sorted in ascending order

double looping logic:
  access first element of first array
  multiply all elements of second array by that value
  add to new array
  then move on to subsequent elements of first array
  repeating multiplication & insertion into new array

*examples / test cases *
see above

*data structures*
arrays

*algorithm*
BEGIN
  declare method that takes two arrays of integers as arguments
    SET all_products = [] empty array to hold return results
    SET counter = 0
    WHILE there are elements in the first array to evaluate (or while all_products.size < arr1.size * arr2.size)
      SET factor1 = arr1[counter]
      SET counter2 = 0
      WHILE there are elements remaining in arr2 to evaluate (or while counter2 < arr2.size)
        SET factor2 = arr2[counter2]
        SET product = factor1 * factor2
        push product into all_products array
        increment counter2 += 1
      end
      increment counter += 1
    end
    PRINT all_products sorted in ascending order
END
=end

# long form loop
def multiply_all_pairs(arr1, arr2)
  all_products = []
  counter = 0
  while all_products.size < arr1.size * arr2.size
    factor1 = arr1[counter]
    counter2 = 0
    while counter2 < arr2.size
      factor2 = arr2[counter2]
      all_products << factor1 * factor2
      counter2 += 1
    end
    counter += 1
  end
  all_products.sort
end

# Array#each loops
def multiply_all_pairs(arr1, arr2)
  all_products = []
  arr1.each do |el1|
    arr2.each do |el2|
      all_products << el1 * el2
    end
  end
  all_products.sort
end

# Single-Line Course Solution
# I thought I remembered there being a #product method but didn't want to spend
# too long hunting when I knew I could solve this using loops - like zip, it
# creates paired nested arrays which then need to be reduced into the desired products.    
def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
