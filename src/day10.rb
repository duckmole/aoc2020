def read_file(name)
  file = File.open(name)
  file.readlines.map(&:chomp).map(&:to_i)
end


def puzzle1(data)
  data = data.sort
  result = {1 => 0, 2 => 0, 3 => 0}
  result[data.first] = 1
  (data.size - 1).times do |index|
    key = data[index+1] - data[index]
    if key > 3
      return data[index] + 3, result
    end
    result[key] += 1
  end
  result[3] += 1
  [data.last + 3, result, result[1]*result[3]]
end
