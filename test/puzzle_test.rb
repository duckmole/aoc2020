require 'minitest/autorun'
require_relative '../src/puzzle.rb'

class PuzzleTest < Minitest::Test
  def test_day_1_1
    assert_equal 2019, day1([1, 2019])
    assert_equal 388075, day1_1('data/day1.txt')
  end

  def test_day_1_2
    assert_equal 293450526, day1_2('data/day1.txt')
  end

  def test_day_2_1
    data = ["1-3 a: abcde","1-3 b: cdefg","2-9 c: ccccccccc"]
    assert_equal 2, day2_1(data)
    assert_equal 548, day2_1(read_file('data/day2.txt'))
  end

  def test_day_2_2
    data = ["1-3 a: abcde","1-3 b: cdefg","2-9 c: ccccccccc"]
    assert_equal 1, day2_2(data)
    assert_equal 502, day2_2(read_file('data/day2.txt'))
  end

  def test_day_3_1
    data = ['..##.......', '#...#...#..', '.#....#..#.', '..#.#...#.#',
            '.#...##..#.', '..#.##.....', '.#.#.#....#', '.#........#',
            '#.##...#...', '#...##....#', '.#..#...#.#']
    assert_equal 7, day3_1(data)
    assert_equal 230, day3_1(read_file('data/day3.txt'))
  end
end
