=begin
*assignment*
Grocery List
Write a method which takes a grocery list (array) of fruits with quantities and
converts it into an array of the correct number of each fruit.

Example:
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

*problem*
input: nested array. each subarray contains a string and an integer
output: flat array with strings as elements. the string elements represent the
fruits of the appropriate quantities represented by the integers in the initial
list.

*examples / test cases *
see above

*data structures*
nested array to new flat array

*algorithm*
BEGIN
  declare a method that takes a single array of nested arrays as an argument
    SET fruit_list = empty array to hold return value
    WHILE there are nested arrays to evaluate
      SET count = subarr[1]
      push subarr[0] * count to fruit_list
    PRINT fruit_list
END
=end

def buy_fruit(fruit_count)
  fruit_list = []
  counter = 0
  while counter < fruit_count.size
    fruit_count[counter][1].times do
      fruit_list << fruit_count[counter][0]
    end
    counter += 1
  end
  fruit_list
end

def buy_fruit(fruit_count)
  fruit_list = []
  fruit_count.each do |fruit_arr|
    fruit_arr[1].times do
      fruit_list << fruit_arr[0]
    end
  end
  fruit_list
end

def buy_fruit(fruit_count)
  fruit_list = fruit_count.each_with_object([]) do |fruit_arr, fruit_list|
    fruit_arr[1].times do
      fruit_list << fruit_arr[0]
    end
  end
  fruit_list
end

def buy_fruit(fruit_count)
  fruit_list = fruit_count.each_with_object([]) do |fruit_arr, fruit_list|
    fruit_list << [fruit_arr[0]] * fruit_arr[1]
  end
  fruit_list.flatten
end

# Course Solution - I had wanted to use Array#map but couldn't figure out how to
# get the strings not to join before adding to the array. Apparently, enclosing
# their variable in brackets does the trick of adding it as an array!
def buy_fruit(fruit_count)
  fruit_count.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) # ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
