def read_file(name)
  file = File.open(name)
  file.readlines.map(&:chomp)
end
def passports(data)
  data.join(' ').split('  ')
end

def between(min, max, value)
  return value >=  min && value <= max
end

def years_between(min, max, data)
  year = /\A\d{4}\z/.match(data)[0]
  return unless year
  return between(min, max, year.to_i)
end

def height(data)
  hgt_cm = /\A(\d{3})cm\z/.match(data)
  hgt_in = /\A(\d{2})in\z/.match(data)
  if hgt_cm
    between(150, 193, hgt_cm[1].to_i)
  elsif hgt_in
    between(59,76, hgt_in[1].to_i)
  else
    false
  end
end

def html_color(data)
  /(?<=#)(?<!^)\h{6}\z/.match(data)
end

def eye_color(data)
  %w[amb blu brn gry grn hzl oth].include? data
end

def nine_digit(data)
  /\A\d{9}\z/.match(data)
end

def full_valid(passport)
  return 0 if valid(passport) == 0
  required_keys = {
    'byr' => lambda { |data| years_between(1920, 2002, data) },
    'iyr' => lambda { |data| years_between(2010, 2020, data) },
    'eyr' => lambda { |data| years_between(2020, 2030, data)},
    'hgt' => lambda { |data| height(data) },
    'hcl' => lambda { |data| html_color(data) },
    'ecl' => lambda { |data| eye_color(data) },
    'pid' => lambda { |data| nine_digit(data) },
    'cid' => lambda { |data| true }
  }
  valids = passport.split(' ').inject(true) { |acc, key_value|
    key, value = key_value.split(':')
    acc && required_keys[key].call(value)
  }
  valids ? 1 : 0
end

def valid(passport)
  required_keys = ['ecl', 'pid', 'eyr', 'hcl', 'byr', 'iyr', 'hgt']
  keys = passport.split(' ').inject([]) { |acc, value|
    acc << value.split(':')[0]
  }
  (required_keys - keys).empty? ? 1 : 0
end

def puzzle1(data)
  passports(data).inject(0) { |acc, passport|
    acc + valid(passport)
  }
end

def puzzle2(data)
  passports(data).inject(0) { |acc, passport|
    acc + full_valid(passport)
  }
end
