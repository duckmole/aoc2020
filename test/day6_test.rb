require 'minitest/autorun'
require_relative '../src/day6.rb'

class Day4Test < Minitest::Test
  def test_1
    data = ['abcx', 'abcy', 'abcz']
    assert_equal 6, nb_question(data)
    data = ['abc', '', 'a', 'b', 'c', '', 'ab', 'ac', '', 'a', 'a', 'a', 'a', '', 'b']
    assert_equal 11, puzzle1(data)
    assert_equal 6885, puzzle1(read_file('data/day6.txt'))
  end

  def test_2
    data = ['abc', '', 'a', 'b', 'c', '', 'ab', 'ac', '', 'a', 'a', 'a', 'a', '', 'b']
    assert_equal 6, puzzle2(data)
    assert_equal 3550, puzzle2(read_file('data/day6.txt'))
  end
end
