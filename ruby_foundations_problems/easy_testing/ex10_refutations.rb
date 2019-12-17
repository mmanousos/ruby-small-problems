# Refutations
# Write a unit test that will fail if 'xyz' is one of the elements in the Array
# `list`.

require 'minitest/autorun'
require 'mintiest/pride'

require_relative 'refute'

class RefuteTest < MiniTest::Test
  def test_refute
    refute_includes(list, 'xyz')
  end
end
