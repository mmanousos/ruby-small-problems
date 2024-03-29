# 7. Account Balance
=begin
Time for a check of your financial situation.

The output of the code below tells you that you have around $70. However, you expected your bank account to have about $238. What did we do wrong?

# Financially, you started the year with a clean slate.
=end
balance = 0

# Here's what you earned and spent during the first three months.

january = {
  income: [ 1200, 75 ],
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
}

february = {
  income: [ 1200 ],
  expenses: [ 650, 140, 320, 46.7, 122.5 ]
}

march = {
  income: [ 1200, 10, 75 ],
  expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
}

# Let's see how much you've got now...

def calculate_balance(month)
  plus  = month[:income].sum
  minus = month[:expenses].sum

  plus - minus
end

[january, february, march].each do |month|
  balance = calculate_balance(month) # this line is only outputting the final month's calculations. needs to be balance += calculate_balance(month) so each month is added to the total.
end

puts balance

# I started by checking whether .sum was a valid method for an array. Turns out it is in newer versions of ruby than the one I have installed.
=begin
def calculate_balance(month)
  puts plus  = month[:income].sum
  puts minus = month[:expenses].sum

  puts plus - minus
end

january = {
  income: [ 1200, 75 ],
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
}

calculate_balance(january)
=end
