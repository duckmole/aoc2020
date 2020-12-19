require 'minitest/autorun'
require_relative '../src/day18.rb'

class Day18Test < Minitest::Test
  def test_1
    assert_equal 26, compute_line('2 * 3 + (4 * 5)')
    assert_equal 437, compute_line('5 + (8 * 3 + 9 + 3 * 4 * 3)')
    assert_equal 12240, compute_line('5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))')
    assert_equal 13632, compute_line('((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2')
    assert_equal 4696493914530, puzzle1(read_file('data/day18.txt'))
  end

  def test_2
    assert_equal 51, compute_line2('1 + (2 * 3) + (4 * (5 + 6))')
    assert_equal 46, compute_line2('2 * 3 + (4 * 5)')
    assert_equal 1445, compute_line2('5 + (8 * 3 + 9 + 3 * 4 * 3)')
    assert_equal 669060, compute_line2('5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))')
    assert_equal 23340, compute_line2('((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2')
    assert_equal 362880372308125, puzzle2(read_file('data/day18.txt'))
    return
  end
end
