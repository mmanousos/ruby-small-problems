# Equality Assertions
# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

require 'minitest/autorun'

require_relative 'equality'

class EqualityTest < MiniTest::Test
  def test_downcase
    assert_equal('xyz', value.downcase)
  end
end
