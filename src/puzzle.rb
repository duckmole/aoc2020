def read_file(name)
  file = File.open(name)
  file.readlines.map(&:chomp)
end

def day1(data, comb: 2)
  data.combination(comb).select {|values| values.sum == 2020}.first.inject(1, &:*)
end

def day1_1(day)
  data = read_file(day).map(&:to_i)
  day1(data, comb: 2)
end

def day1_2(day)
  data = read_file(day).map(&:to_i)
  day1(data, comb: 3)
end

def pwd_valid1(line)
  m = line.match(/(\d*)-(\d*) (\w): (\w*)/)
  nb = m[4].count(m[3])
  nb >= m[1].to_i && nb <= m[2].to_i
end

def pwd_valid2(line)
  m = line.match(/(\d*)-(\d*) (\w): (\w*)/)
  letter = m[3]
  (m[4][m[1].to_i-1] == letter) ^
    (m[4][m[2].to_i-1] == letter)
end

def day2_1(data)
  data.select {|line| pwd_valid1(line)}.count
end

def day2_2(data)
  data.select {|line| pwd_valid2(line)}.count
end

def day3_1(data, right: 3, down: 1)
  modulo = data[0].length
  data.each_with_index.select do |line, index|
    line[right * (index / down) % modulo] == '#' && index.remainder(down) == 0 # /
  end.count
end

def day3_2(data)
  [[1, 1], [3, 1], [5, 1], [7, 1], [1,2]].inject(1) {|acc, values|
    acc * day3_1(data, right: values[0], down: values[1])
  }
end
