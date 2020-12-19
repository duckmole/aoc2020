def read_file(name)
  file = File.open(name)
  file.readlines.map(&:chomp)
end

class Fixnum
  def mult(nr)
    self * nr
  end
  def add(nr)
    self + nr
  end
end

def puzzle1(data)
  data.inject(0) { |acc, line|
    acc + compute_line(line)
  }
end
def puzzle2(data)
  data.inject(0) { |acc, line|
    acc + compute_line2(line)
  }
end

def compute_line(line)
  line = '(' + line.gsub(' * ',').mult(').gsub(' + ',').add(')+ ')'
  eval(line)
end

def compute_line2(line)
  line = '(' +line.gsub(' * ',').mult(').gsub(' +','.add')+ ')'
  eval(line)
end
