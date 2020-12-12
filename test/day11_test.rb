require 'minitest/autorun'
require_relative '../src/day11.rb'

class Day11Test < Minitest::Test

  def test_1
    return
    data = ['L.LL.LL.LL',
            'LLLLLLL.LL',
            'L.L.L..L..',
            'LLLL.LL.LL',
            'L.LL.LL.LL',
            'L.LLLLL.LL',
            '..L.L.....',
            'LLLLLLLLLL',
            'L.LLLLLL.L',
            'L.LLLLL.LL']
    assert_equal 37, puzzle1(data)
    assert_equal 2448, puzzle1(read_file('data/day11.txt'))
  end
  def test_2
    data = ['L.LL.LL.LL',
            'LLLLLLL.LL',
            'L.L.L..L..',
            'LLLL.LL.LL',
            'L.LL.LL.LL',
            'L.LLLLL.LL',
            '..L.L.....',
            'LLLLLLLLLL',
            'L.LLLLLL.L',
            'L.LLLLL.LL']
    assert_equal 26, puzzle2(data)
    assert_equal 2234, puzzle2(read_file('data/day11.txt'))
  end
end
2305
