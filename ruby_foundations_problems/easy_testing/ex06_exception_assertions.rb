# Exception Assertions
# Write a minitest assertion that will fail unless employee.hire raises a
# NoExperienceError exception.

require 'minitest/autorun'

require_relative 'exception'

class ExceptionTest < MiniTest::Test
  def test_exception
    assert_raises(NoExperienceError) do
      employee.hire
    end
  end
end
