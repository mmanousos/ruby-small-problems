# Boolean Assertions
# Write a minitest assertion that will fail if the value.odd? is not true.

require 'minitest/autorun'

require_relative 'boolean'

class BooleanTest < MiniTest::Test
  def test_odd?
    assert_equal(true, value.odd?)
  end
end

# Course Solution
assert value.odd?, 'value is not odd'
# can use simple `#assert` method and add a message as the second argument
