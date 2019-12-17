require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'

require_relative 'cash_register'
require_relative 'transaction'

class TestCashRegister < MiniTest::Test
  # def setup
  #   @register = CashRegister.new(100)
  #   @transaction = Transaction.new(50)
  # end
  #
  # def test_accept_money
  #   @transaction.amount_paid = 50
  #   assert_equal(150, @register.accept_money(@transaction))
  # end

  # Course Solution version - spells out steps explicitly
  def test_accept_money
    register = CashRegister.new(100)
    transaction = Transaction.new(50)
    transaction.amount_paid = 50

    beginning_balance = register.total_money
    register.accept_money(transaction)
    current_balance = register.total_money

    assert_equal(beginning_balance + 50, current_balance)
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(25)
    transaction.amount_paid = 50

    assert_equal(25, register.change(transaction))
  end

  def test_receipt
    item_cost = 50
    register = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)
    assert_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end
end

# Test Accept Money Method - Cash Register
# We now have the foundation of our CashRegister test class set up. Let's start
# testing! We'll start with the CashRegister#accept_money method. Write a test
# for the #accept_money method.

# Test Change Method - Cash Register
# Write a test for the method, CashRegister#change.

# Test Give Receipt Method - Cash Register
# Write a test for method CashRegister#give_receipt that ensures it displays a
# valid receipt.
