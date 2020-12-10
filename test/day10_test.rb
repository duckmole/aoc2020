require 'minitest/autorun'
require_relative '../src/day10.rb'

class Day10Test < Minitest::Test

  def test_1
    data = [16, 10, 15, 5, 1, 11, 7, 19, 6, 12, 4]
    assert_equal [22, {1=>7, 2=>0, 3=>5}, 35], puzzle1(data)
    data = [28, 33, 18, 42, 31, 14, 46, 20, 48, 47, 24, 23,
            49, 45, 19, 38, 39, 11, 1, 32, 25, 35, 8,  17, 7,
            9, 4, 2, 34, 10, 3]
    assert_equal [52, {1=>22, 2=>0, 3=>10}, 220], puzzle1(data)
    assert_equal [175, {1=>73, 2=>0, 3=>34}, 2482], puzzle1(read_file('data/day10.txt'))
  end
end
