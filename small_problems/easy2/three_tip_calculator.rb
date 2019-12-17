=begin
*assignment*
Tip calculator
Create a simple tip calculator. The program should prompt for a bill amount and
a tip rate. The program must compute the tip and then display both the tip and
the total amount of the bill.

Example:
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
*problem*
input: bill amount (string - convert to float), tip percentage (string - convert
to float then to percentage, if required)
output: tip total (calculated by multiplying bill amount by tip amount),
total to pay (bill amount plus tip total)
Should verify that neither bill or tip percentage are negative.
Also, if tip percentage is represented as a percentage (less than 1), no need to
convert to float / percentage

*examples / test cases *
bill: 200; percentage: 15 => tip: $30.0; total: $230.0
bill: 10; percentage: 5 => tip: $.50; total: $10.50
bill: 10; percentage: .05 => tip: $.50; total: $10.50
bill: 0; percentage: 5 => loop until bill > 0
bill: -5; percentage: 5 => loop until bill > 0
bill: 200; percentage: -5 => loop until percentage > 0

*data structures*
input: integer or float + integer or float
output: strings containing floats

*algorithm*
START
  LOOP
    PUT What is the bill?
    GET & SET bill_amount - convert to float
    check IF bill amount is <= 0
      break if > 0
    ELSE PUT please provide a positive bill amount
  end

  LOOP
    PUT What is the tip percentage?
    GET & SET tip_percentage - convert to float
    check IF bill amount is < 0
      break if > 0
    ELSE PUT please provide a positive tip percentage
  end

  IF tip_percentage > 1
    tip_percentage = tip_percentage / 100

  tip_amount = bill_amount * tip_percentage
  bill_total = tip_amount + tip_amount

  PUTS "The tip is " + tip_amount
  PUTS "The total is " + bill_total
END
=end

bill_amount = nil
tip_percentage = nil

loop do
  puts 'What is the bill?'
  bill_amount = gets.chomp.to_f
  break if bill_amount > 0
  puts 'Please provide a positive bill amount.'
end

loop do
  puts 'What is the tip percentage?'
  tip_percentage = gets.chomp.to_f
  break if tip_percentage > 0
  puts 'Please provide a positive tip percentage.'
  tip_percentage
end

if tip_percentage > 1
  tip_percentage /= 100
end

tip_amount = bill_amount * tip_percentage
bill_total = bill_amount + tip_amount

puts 'The tip is $' + format('%.02f', tip_amount)
puts 'The total is $' + format('%.02f', bill_total)

# Further Exploration
=begin
Our solution prints the results as $30.0 and $230.0 instead of the more usual
$30.00 and $230.00. Modify your solution so it always prints the results with
2 decimal places.

Hint: You will likely need Kernel#format for this.
=end
