# Type Assertions
# Write a minitest assertion that will fail if value is not an instance of the
# Numeric class exactly. value may not be an instance of one of Numeric's
# superclasses.

require 'minitest/autorun'

require_relative 'type'

class TypeTest < MiniTest::Test
  def test_type
    assert_instance_of(Numeric, value)
  end
end

# don't need to call #class on the object in question because
#assert_instance_of calls #instance_of on the object and compares to first arg.

# If want to use #class, would need to call #assert_equal and set expected to true
# But it's less direct and error message will be less clear.
# e.g.
# def test_type
#   assert_equal(true, value.class == Numeric)
# end
