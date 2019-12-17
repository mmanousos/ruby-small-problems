=begin
*assignment*
Getting Things Done
We wrote a method for moving a given number of elements from one array to
another. We decide to test it on our todo list, but invoking move on line 11
results in a SystemStackError. What does this error mean and why does it happen?

def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example
todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

=end

SystemStackError indicates that the stack is too full from either a recursive
method call or infinite loop.
This happens because the move method is called again within the definition of
the move method.
It can be corrected by removing that second method call and replacing it with
  n.times { to_array << from_array.shift }

  def move(n, from_array, to_array)
    n.times { to_array << from_array.shift }
  end

  # Example
  todo = ['study', 'walk the dog', 'coffee with Tom']
  done = ['apply sunscreen', 'go to the beach']

  move(2, todo, done)

  p todo # should be: ['coffee with Tom']
  p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# Course Solution
adding a base condition to the recursive call under which the recursion will stop.
def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Further Exploration
# What happens if the length of the from_array is smaller than n?

nil is added to the to_array for every value beyond the size of the from_array,
representing the number of times the recursion or iteration is executed on the
now-empty array.
