=begin
*assignment*
Bubble Sort
Bubble Sort is one of the simplest sorting algorithms available. It isn't an
efficient algorithm, but it's a great exercise for student developers. In this
exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. On
each pass, each pair of consecutive elements is compared. If the first of the
two elements is greater than the second, then the two elements are swapped. This
process is repeated until a complete pass is made without performing any swaps;
at that point, the Array is completely sorted.

6	2	7	1	4	  Start: compare 6 > 2? Yes
2	6	7	1	4	  Exchange
2	6	7	1	4	  6 > 7? No (no exchange)
2	6	7	1	4	  7 > 1? Yes
2	6	1	7	4	  Exchange
2	6	1	7	4	  7 > 4? Yes
2	6	1	4	7	  Exchange
2	6	1	4	7	  2 > 6? No
2	6	1	4	7	  6 > 1? Yes
2	1	6	4	7	  Exchange
2	1	6	4	7	  6 > 4? Yes
2	1	4	6	7	  Exchange
2	1	4	6	7	  6 > 7? No
2	1	4	6	7	  2 > 1? Yes
1	2	4	6	7	  Exchange
1	2	4	6	7	  2 > 4? No
1	2	4	6	7	  4 > 6? No
1	2	4	6	7	  6 > 7? No
1	2	4	6	7	  1 > 2? No
1	2	4	6	7	  2 > 4? No
1	2	4	6	7	  4 > 6? No
1	2	4	6	7	  6 > 7? No
1	2	4	6	7	  No swaps; all done; sorted

We can stop iterating the first time we make a pass through the array without
making any swaps; at that point, the entire Array is sorted.

For further information, including pseudo-code that demonstrates the algorithm
as well as a minor optimization technique, see the Bubble Sort wikipedia page
(https://en.wikipedia.org/wiki/Bubble_sort).

Write a method that takes an Array as an argument, and sorts that Array using
the bubble sort algorithm as just described. Note that your sort will be
"in-place"; that is, you will mutate the Array passed as an argument.
You may assume that the Array contains at least 2 elements.

Examples
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

*problem*
input: array of at least 2 elements
output: mutated orginal array sorted in ascending order

*examples / test cases *
see above

*data structures*
array

*algorithm*
BEGIN
loop continually until the array == array.sort
  count1 = 0

  while count1 < arr.size
    count2 = count1 + 1
    if arr[count1] > arr[count2]
      arr[count1], arr[count2] = arr[count2], arr[count1]
    end
  count1 += 1
END
=end

def bubble_sort!(arr)
  while arr != arr.sort
    count1 = 0

    while count1 < arr.size - 1
      count2 = count1 + 1
      if arr[count1] > arr[count2]
        arr[count1], arr[count2] = arr[count2], arr[count1]
      end

      count1 += 1
    end
  end

  arr
end

# pseudocode from wikipedia
=begin
procedure bubbleSort( A : list of sortable items )
    n = length(A)
    repeat
        swapped = false
        for i = 1 to n-1 inclusive do
            /* if this pair is out of order */
            if A[i-1] > A[i] then
                /* swap them and remember something changed */
                swap( A[i-1], A[i] )
                swapped = true
            end if
        end for
    until not swapped
end procedure
=end

# my attempt at the wikipedia algorithm
def bubble_sort!(arr)
  n = arr.size
  loop do
    swapped = false
    for i in (1..n-1) do
      if arr[i-1] > arr[i]
        arr[i-1], arr[i] = arr[i], arr[i-1]
        swapped = true
      end
    end
    break if swapped == false
  end
  arr
end

# wikipedia optimized algorithm
=begin
procedure bubbleSort( A : list of sortable items )
    n = length(A)
    repeat
        swapped = true
        for i = 1 to n-1 inclusive do
            if A[i-1] > A[i] then
                swap(A[i-1], A[i])
                swapped = False
            end if
        end for
        n = n - 1
    until swapped
end procedure
=end

def bubble_sort!(arr)
  n = arr.size
  loop do
    swapped = true
    for i in 1..n-1 do
      if arr[i-1] > arr[i]
        arr[i-1], arr[i] = arr[i], arr[i-1]
        swapped = false
      end
    end
    n = n - 1
    break if swapped
  end
  arr
end

p array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

p array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
