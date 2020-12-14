def read_file(name)
  file = File.open(name)
  file.readlines.map(&:chomp)
end

def puzzle1(data)
  timestamp, buses = data
  timestamp = timestamp.to_i
  buses = buses.split(',').select { |nb| nb != 'x' }.map(&:to_i)
  wait, bus = buses.map { |bus| [bus-(timestamp % bus), bus] }.sort.first
  bus * wait
end

def read(data)
  timestamp, lines = data
  buses = []
  lines.split(',').each_with_index do |bus, index|
    buses << [bus.to_i, index] if bus != 'x'
  end
  buses
end

def valid(value, buses)
  buses.each do |bus, timestamp|
    return false if (value + timestamp) % bus != 0
  end
  return true
end

def puzzle2(data, step: 1)
  buses = read(data)
  bus, timestamp = buses[0]
  buses = buses [1..]
  index = 0
  while true
    index += step
    value = bus*index - timestamp
    puts "#{index} - #{value}" if (index % 10000000) == 0
    return value if valid(value, buses)
  end
end

def multi(b1, t1, b2, t2)
  time = t1
  while  (time+t2) % b2 != 0
    time += b1
  end
  time
end

def multiples(data)
  return data if data.length == 1
  b1, t1 = data.shift
  b2, t2 = data.shift
  multiples([[b2*b1, multi(b1,t1,b2,t2)]] + data)
end


def puzzle2_opt(data)
  data = read(data)
  multiples(data)[0][1]
end
