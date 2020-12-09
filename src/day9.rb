def read_file(name)
  file = File.open(name)
  file.readlines.map(&:chomp).map(&:to_i)
end

def invalid(data, number)
  data.combination(2).select {|values| values.sum == number}.empty?
end

def puzzle1(data, step: 5)
  data.length.times do |index|
    number = data[index + step]
    return [number, index] if invalid(data[index..index+step-1],number)
  end
end

def puzzle2(data, step: 5)
  expected, index = puzzle1(data, step: step)
  data = data[0..index]
  index.times.each do |size|
    (0..index-size).each do |offset|
      values = data[offset..offset+size]
      return values.min + values.max if values.sum == expected
    end
  end
  :error
end
