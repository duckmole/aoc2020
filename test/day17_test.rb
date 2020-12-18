require 'minitest/autorun'
require_relative '../src/day17.rb'

class Day17Test < Minitest::Test
  def test_1
    data = ['.#.', '..#', '###']
    assert_equal 5, puzzle(data,cycle: 0)
    assert_equal 11, puzzle(data,cycle: 1)
    assert_equal 112, puzzle(data,cycle: 6)
    assert_equal 242, puzzle(read_file('data/day17.txt'),cycle: 6)
  end

  def test_to_matrix
    data = ['.#.', '..#', '###']
    assert_equal({[0, 1, 0]=>true, [1, 2, 0]=>true, [2, 0, 0]=>true, [2, 1, 0]=>true, [2, 2, 0]=>true},
                 to_matrix(data, 3))
  end

  def test_2
    data = ['.#.', '..#', '###']
    assert_equal 29, puzzle(data,cycle: 1, dim: 4)
    assert_equal 848, puzzle(data,cycle: 6, dim: 4)
    assert_equal 2292, puzzle(read_file('data/day17.txt'),cycle: 6, dim: 4)
  end
end
