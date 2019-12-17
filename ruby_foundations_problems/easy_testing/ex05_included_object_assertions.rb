# Included Object Assertions
# Write a minitest assertion that will fail if the 'xyz' is not in the Array `list`.

require 'minitest/autorun'

require_relative 'included_object'

class IncludedTest << MiniTest::Test
  def test_included
    assert_includes(list, 'xyz')
  end
end
