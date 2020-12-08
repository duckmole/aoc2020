require 'minitest/autorun'
require_relative '../src/day7.rb'

class Day7Test < Minitest::Test
  def test_values
    assert_equal [[1, 'g h']], translate('1 g h bag.')
    assert_equal [[1, 'd c'], [2, 'e f']], translate('1 d c bag, 2 e f bags.')
    assert_equal [], translate('no other bags.')
  end

  def test_parents
    data = ['d c bags contain 1 g h bag.',
            'a b bags contain 1 d c bag, 2 e f bags.',
            'g h bags contain 2 e f bags',
            'e f bags contain no other bags.']
    parents = bag_parents(data)
    assert_equal ['a b', 'g h'], parents['e f'], parents
    assert_equal ['a b', 'd c', 'g h'], all_parents(parents, 'e f')

  end

  def test_1
    data = ['light red bags contain 1 bright white bag, 2 muted yellow bags.',
            'dark orange bags contain 3 bright white bags, 4 muted yellow bags.',
            'bright white bags contain 1 shiny gold bag.',
            'muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.',
            'shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.',
            'dark olive bags contain 3 faded blue bags, 4 dotted black bags.',
            'vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.',
            'faded blue bags contain no other bags.',
            'dotted black bags contain no other bags.']
    assert_equal 4, puzzle1(data)
    assert_equal 192, puzzle1(read_file('data/day7.txt'))
  end

  def test_children
    data = ['d c bags contain 1 g h bag.',
            'a b bags contain 1 d c bag, 2 e f bags.',
            'g h bags contain 2 e f bags',
            'e f bags contain no other bags.']
    children = bag_children(data)
    assert_equal({'d c' => 1, 'e f' => 2}, children['a b'], children)
    assert_equal({'e f' => 2}, children['g h'], children)
  end

  def test_2
    data = ['light red bags contain 1 bright white bag, 2 muted yellow bags.',
            'dark orange bags contain 3 bright white bags, 4 muted yellow bags.',
            'bright white bags contain 1 shiny gold bag.',
            'muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.',
            'shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.',
            'dark olive bags contain 3 faded blue bags, 4 dotted black bags.',
            'vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.',
            'faded blue bags contain no other bags.',
            'dotted black bags contain no other bags.']
    assert_equal 32, puzzle2(data)
    assert_equal 12128, puzzle2(read_file('data/day7.txt'))
  end
end
