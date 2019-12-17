# Kind Assertions
# Write a minitest assertion that will fail if the class of value is not Numeric
# or one of Numeric's subclasses (e.g., Integer, Float, etc).

require 'minitest/autorun'

require_relative 'kind'

class KindTest < MiniTest::Test
  def test_kind
    assert_kind_of(Numeric, value) 
  end
end
