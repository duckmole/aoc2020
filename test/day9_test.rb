require 'minitest/autorun'
require_relative '../src/day9.rb'

class Day9Test < Minitest::Test

  def test_1
    data = [35, 20, 15, 25, 47, 40,
            62, 55, 65, 95, 102, 117, 150,
            182, 127, 219, 299, 277, 309, 576]
    assert_equal [127, 9], puzzle1(data)
    assert_equal [23278925, 489], puzzle1(read_file('data/day9.txt'), step: 25)
  end

  def test_2
    data = [35, 20, 15, 25, 47, 40,
            62, 55, 65, 95, 102, 117, 150,
            182, 127, 219, 299, 277, 309, 576]
    assert_equal 62, puzzle2(data)
    assert_equal 4011064, puzzle2(read_file('data/day9.txt'), step: 25)
  end


end
