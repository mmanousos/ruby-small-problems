# Given an array of numbers find if any 3 numbers inside of the array
#   can be multiplied to get the maximum number in the array.
#   If the number is used once it can't be used again. If there articletwo same numbers
#   then that number can be used 2 times.

# in: array of integers
# out: boolean representing if any three of the integers can be multiplied to == the largest integer

# AL: set the largest integer to a variable
# 2 loops:
# cycle through the array, getting each sequential pair of values
#   inner loop, check those two & each of the subsequent values to see if their product == the largest



def mult_of_three_nums(arr)
  return nil if arr.size < 3
  0.upto(arr.size - 3) do |first_idx|
    binding.pry
    (first_idx + 1).upto(arr.size - 2) do |second_idx|
      (second_idx + 1).upto(arr.size - 1) do |third_idx|
        return true if arr[first_idx] * arr[second_idx] * arr[third_idx] == arr.max
      end
    end
  end
  false
end





# def mult_of_three_nums(arr)
#   largest = arr.max

#   arr.each_cons(2).with_index do |pair, idx|
#     counter = idx + 2
#     loop do
#       return true if pair.reduce(:*) * arr[counter] == largest
#       counter += 1
#       break if counter > arr.size
#     end
#   end

#   false
# end



# p mult_of_three_nums([1,2,3,4,5,6]) == true
# p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) #== true
# p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
# p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
# p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false
