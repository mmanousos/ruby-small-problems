=begin
Problem
each_cons (Part 2)
In the previous exercise, we wrote a method that emulates Enumerable#each_cons,
but limited our method to handling 2 elements at a time. Enumerable#each_cons
can actually handle any number of elements at a time: 1, 2, 3, or more.

Update your each_cons method so it takes an argument that specifies how many
elements should be processed at a time.

Your method may use #each, #each_index, #each_with_object, #inject, loop, for,
while, or until to iterate through the Array passed in as an argument, but must
not use any other methods that iterate through an Array or any other
collection.

Examples
hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
hash == {}

Algorithm
  BEGIN
    array and quantity as arguments
    iterate over array with index
    pass each element + quantity number of additional elements to block
      should these be an array themselves?
    return nil
  END

=end

def each_cons(array, increment)
  break_integer = increment - 1

  array.each_with_index do |el, index|
    break if index + break_integer >= array.size

    if increment == 1
      yield(el)
    elsif increment == 2
      yield(el, array[index+1])
    else
      values = (array[index...index+increment])
      yield(values)
    end
  end
  nil
end

# Course Solution
# def each_cons(array, n)
#   array.each_with_index do |el, index|
#     break if index + n - 1 >= array.size
#     yield(*array[index..index + n - 1])
#   end
#   nil
# end

# refinement to Course Solution
def each_cons(array, increment)
  array.each_with_index do |el, index|
    max_size = index + increment - 1
    break if max_size >= array.size
    yield(*array[index..max_size])
  end
  nil
end

# could also simply use the second argument in the slice method to dictate how
# many arguments to pass to the block
def each_cons(array, increment)
  array.each_with_index do |el, index|
    break if index + increment - 1 >= array.size
    yield(*array[index, increment])
  end
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}
