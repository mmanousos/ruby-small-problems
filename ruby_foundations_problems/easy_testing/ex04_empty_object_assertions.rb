# Empty Object Assertions
# Write a minitest assertion that will fail if the Array list is not empty.

require 'minitest/autorun'

require_relative 'empty_object'

class EmptyObjectTest < Minitest::Test
  def test_empty
    assert_equal(true, array.empty?)
  end
end

# Course Solution - more direct and better error message
class EmptyObjectTest < Minitest::Test
  def test_empty
    assert_empty(array)
  end
end
