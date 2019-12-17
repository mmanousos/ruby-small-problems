# Nil Assertions
# Write a minitest assertion that will fail if value is not nil.

require 'minitest/autorun'

require_relative 'nil'

class NilTest < MiniTest::Test
  def test_nil
    assert_equal(nil, value)
  end
end

# Course Solution - More direct and with better error message 
class NilTest < MiniTest::Test
  def test_nil
    assert_nil(value)
  end
end
