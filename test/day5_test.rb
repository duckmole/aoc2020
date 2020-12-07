require 'minitest/autorun'
require_relative '../src/day5.rb'

class Day4Test < Minitest::Test
  def test_1
    assert_equal 567, puzzle1("BFFFBBFRRR")
    assert_equal 532, puzzle1("BFFFFBFRLL")
    assert_equal 883, read_file('data/day5.txt').map{ |seat| puzzle1(seat)}.max
  end

  def test_2
    assert_equal 532, ((1..883).to_a - read_file('data/day5.txt').map{ |seat| puzzle1(seat)}.sort).last
  end
end
