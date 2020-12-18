def read_file(name)
  file = File.open(name)
  file.readlines.map(&:chomp)
end

def get_validator(value)
  _ununsed, min1, max1, min2, max2 = /(\d*)-(\d*) or (\d*)-(\d*)/.match(value).to_a
  lambda { |number|
    (number >= min1.to_i && number <= max1.to_i) || (number >= min2.to_i && number <= max2.to_i)
  }
end

def read_data(data)
  result = { rules: {}, ticket: '', nearby: [] }
  while (line = data.shift()) && line != ''
    key, value = line.split(': ')
    result[:rules][key] = get_validator(value)
  end
  data.shift
  result[:ticket] = data.shift
  data.shift
  data.shift
  result[:nearby] = data
  result[:valid] = data.select { |line| wrong_number(line, result[:rules]) == 0}
  result[:columns] = [result[:rules].keys] *  result[:ticket].split(',').length
  result[:valid].each do |line|
    line.split(',').map(&:to_i).each_with_index do |number, index|
      result[:columns][index] = result[:columns][index] & valid_rules(number, result[:rules])
    end
  end
  result[:columns] = result[:columns].each_with_index { |line, index| line << index << line.length }
  result[:columns].sort { |a,b| puts a.last.inspect; (a.last <=> b.last) }
  result
end

def valid_rules(number, rules)
  rules.keys.select { |key| rules[key].call(number)}
end

def valid_line(line, rules)
  line.split(',').map(&:to_i).inject(0) { |acc, number|
    valid = false
    rules.each do |key, rule|
      valid = valid && rule.call(number)
    end
    valid
  }
end

def wrong_number(line, rules)
  line.split(',').map(&:to_i).inject(0) { |acc, number|
    valid = false
    rules.each do |key, rule|
      valid = valid || rule.call(number)
    end
    acc + (valid ? 0 : number)
  }
end

def puzzle1(data)
  hash_data = read_data(data)
  hash_data[:nearby].inject(0) {|acc, line|
    acc + wrong_number(line, hash_data[:rules])
  }
end

def puzzle2(data)
  read_data(data)[:columns]
end
