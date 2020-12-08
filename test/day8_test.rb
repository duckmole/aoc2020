require 'minitest/autorun'
require_relative '../src/day8.rb'

class Day8Test < Minitest::Test

  def test_line
    assert_equal({cmd: 'nop', data: 0, done: false}, line('nop +0'))
  end

  def test_1
    data = ['nop +0', 'acc +1', 'jmp +4', 'acc +3', 'jmp -3', 'acc -99', 'acc +1', 'jmp -4', 'acc +6']
    assert_equal 5, puzzle1(data)
    assert_equal 1594, puzzle1(read_file('data/day8.txt'))
  end

  def test_2
    data = ['nop +0', 'acc +1', 'jmp +4', 'acc +3', 'jmp -3', 'acc -99', 'acc +1', 'jmp -4', 'acc +6']
    assert_equal 8, puzzle2(data)
    assert_equal 758, puzzle2(read_file('data/day8.txt'))
  end


end
