require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'

require_relative 'transaction'

class TestTransaction < MiniTest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(50)
    input = StringIO.new('50\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(50, transaction.amount_paid)
  end
end

# Test Prompt For Payment Method- Transaction
# Write a test that verifies that `Transaction#prompt_for_payment` sets the
# `amount_paid` correctly.

# Alter Prompt For Payment Method - Transaction
# You may have noticed something when running the test for the previous exercise.
# And that is that our minitest output wasn't that clean. We have some residual
# output from the Transaction#prompt_for_payment method.
#
# Transaction#prompt_for_payment has a call to Kernel#puts and that output is
# showing up when we run our test. Your task for this exercise is to make it so
# that we have "clean" output when running this test.
