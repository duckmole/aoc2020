def read_file(name)
  file = File.open(name)
  file.readlines.map(&:chomp)
end

def puzzle1(data)
  data.gsub('F','0').gsub('B', '1').gsub('L','0').gsub('R', '1').to_i(2)
end

def puzzle2(data)

end
