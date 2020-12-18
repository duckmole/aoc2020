require 'minitest/autorun'
require_relative '../src/day16.rb'

class Day16Test < Minitest::Test
  def test_rules
    data = ['class: 1-3 or 5-7', 'row: 6-11 or 33-44', 'seat: 13-40 or 45-50','',
            'your ticket:', '7,1,14','',
            'nearby tickets:', '7,3,47', '40,4,50', '55,2,20','38,6,12']
    hash_data = read_data(data)
    assert_equal([:rules, :ticket, :nearby, :valid, :columns], hash_data.keys)
    assert_equal 4, wrong_number('40,4,50', hash_data[:rules])
    assert_equal ['7,3,47'], hash_data[:valid]
    assert_equal [['class','row'], ['class'], ['seat']],hash_data[:columns]
  end

  def test_columns
    return
    data = ['class: 0-1 or 4-19', 'row: 0-5 or 8-19', 'seat: 0-13 or 16-19', '',
            'your ticket:', '11,12,13', '',
            'nearby tickets:', '3,9,18', '15,1,5', '5,14,9']
    hash_data = read_data(data)
    assert_equal [['row'], ['class', 'row'], ['class', 'row', 'seat']],hash_data[:columns]
    end


  def test_1
    return
    data = ['class: 1-3 or 5-7', 'row: 6-11 or 33-44', 'seat: 13-40 or 45-50','',
            'your ticket:', '7,1,14','',
            'nearby tickets:', '7,3,47', '40,4,50', '55,2,20','38,6,12']
    assert_equal 71, puzzle1(data)
    assert_equal 21071, puzzle1(read_file('data/day16.txt'))
  end

  def test_2
    return
    assert_equal 21071, puzzle2(read_file('data/day16.txt'))
  end
end
