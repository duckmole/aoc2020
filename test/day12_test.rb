require 'minitest/autorun'
require_relative '../src/day12.rb'

class Day11Test < Minitest::Test

  def test_1
    data = ['F10', 'N3', 'F7', 'R90', 'F11']
    assert_equal 25, puzzle1(data)
    assert_equal 441, puzzle1(read_file('data/day12.txt'))
  end
  def test_2
    data = ['F10', 'N3', 'F7', 'R90', 'F11']
    assert_equal 286, puzzle2(data)
    assert_equal 40014, puzzle2(read_file('data/day12.txt'))

  end
end
