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
    result[key] += 1
  end
  result[3] += 1
  [data.last + 3, result, result[1]*result[3]]
end

def puzzle2(data)
  data.sort.each_with_object([1]) do |e, lengthes|
    lengthes[e] = lengthes[([0, e-3].max)..([0, e-1].max)].compact.sum
  end.last
end
