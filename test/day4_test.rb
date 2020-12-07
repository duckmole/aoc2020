require 'minitest/autorun'
require_relative '../src/day4.rb'

class Day4Test < Minitest::Test
  def test_1
    data = ['ecl:gry pid:860033327 eyr:2020 hcl:#fffffd',
            'byr:1937 iyr:2017 cid:147 hgt:183cm',
            '',
            'iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884',
            'hcl:#cfa07d byr:1929',
            '',
            'hcl:#ae17e1 iyr:2013',
            'eyr:2024',
            'ecl:brn pid:760753108 byr:1931',
            'hgt:179cm',
            '',
            'hcl:#cfa07d eyr:2025 pid:166559648',
            'iyr:2011 ecl:brn hgt:59in']
    assert_equal 2, puzzle1(data)
    assert_equal 206, puzzle1(read_file('data/day4.txt'))
  end


  def test_2
    data = ['eyr:1972 cid:100 hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926','',
            'iyr:2019 hcl:#602927 eyr:1967 hgt:170cm ecl:grn pid:012533040 byr:1946', '',
            'hcl:dab227 iyr:2012 ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277', '',
            'hgt:59cm ecl:zzz eyr:2038 hcl:74454a iyr:2023 pid:3556412378 byr:2007', '',
            'pid:087499704 hgt:78in ecl:grn iyr:2012 eyr:2030 byr:1980 hcl:#623a2f', '',
            'pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980 hcl:#623a2f',
           ]
    assert_equal 1, puzzle2(data)
    assert_equal 123, puzzle2(read_file('data/day4.txt'))
  end
end
