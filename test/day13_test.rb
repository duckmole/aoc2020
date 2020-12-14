require 'minitest/autorun'
require_relative '../src/day13.rb'

class Day13Test < Minitest::Test

  def test_1
    data = ['939', '7,13,x,x,59,x,31,19']
    assert_equal 295, puzzle1(data)
    assert_equal 1895, puzzle1(read_file('data/day13.txt'))
  end

  def test_2
    data = ['fake', '17,x,13,19']
    assert_equal 3417, puzzle2(data)
    assert_equal 754018, puzzle2(['fake', '67,7,59,61'])
    assert_equal 1202161486 , puzzle2(['fake', '1789,37,47,1889'])
    #assert_equal [[19,3], [17,0], [13,2]], read(read_file('data/day13.txt'))
    #assert_equal 1895, puzzle2(read_file('data/day13.txt'))
  end

  def test_multiples
    data = ['fake', '17,x,13,19']
    assert_equal 3417, puzzle2_opt(data)
    assert_equal 840493039281088, puzzle2_opt(read_file('data/day13.txt'))
  end


end
