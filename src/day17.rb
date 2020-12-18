def read_file(name)
  file = File.open(name)
  file.readlines.map(&:chomp)
end

def active_neighboors(matrix, new, dim)
  count = 0
  [-1,0,1].repeated_permutation(dim).reject { |d| d == [0] * dim }
    .select { |offest| matrix[new.zip(offest).map(&:sum)]}.count
end

def do_cycle(matrix, dim:)
  result = {}
  matrix.keys.each do |current|
    [-1,0,1].repeated_permutation(dim).each do |offest|
      new = current.zip(offest).map(&:sum)
      active = active_neighboors(matrix, new, dim)
      if matrix.include? new
        result[new] = true if active == 2 || active == 3
      else
        result[new] = true if active == 3
      end
    end
  end
  result
end

def puzzle(data, cycle:, dim: 3)
  matrix = to_matrix(data, dim)
  cycle.times do
    matrix = do_cycle(matrix, dim: dim)
  end
  matrix.keys.length
end

def to_matrix(data, dim)
  result = {}
  d = 0
  data.each_with_index do |line, index_line|
    d = line.length
    line.split('').each_with_index do |char, index_col|
      key =  [index_line, index_col] + [0] * (dim -2)
      result[key] = true if char == '#'
    end
  end
  result
end

def puzzle2(data)
  :ok
end
