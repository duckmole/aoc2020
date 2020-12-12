def read_file(name)
  file = File.open(name)
  file.readlines.map(&:chomp)
end

def occupy(data, line_nb, col_nb)
  result = 0
  ([0, line_nb-1].max..[line_nb+1, data.length-1].min).to_a.each do |line|
    ([0, col_nb-1].max..col_nb+1).to_a.each do |col|
      next if line_nb == line && col_nb == col
      result += 1 if data[line][col] == '#'
    end
  end
  result
end

def puzzle1(data)
  new_data = []
  data.each_with_index do |line, line_nb|
    line.split('').each_with_index do |cell, col_nb|
      new_data << '' if col_nb.zero?
      new_data[line_nb] +=
        case cell
        when '.'
          '.'
        when 'L'
          occupy(data, line_nb, col_nb) == 0 ? '#' : 'L'
        when '#'
          occupy(data, line_nb, col_nb) >= 4 ? 'L' : '#'
        end
    end
  end
  return data.join.count('#') if data == new_data
  puzzle1(new_data)
end

def occupy3(data, x, y, dx , dy)
  (1..data.length).each do |facto|
    cx = dx * facto + x
    cy = dy * facto + y
    return false if cx < 0 || cy < 0 || cx == data.length
    return true if data[cx][cy] == '#'
    return false if data[cx][cy] == 'L'
  end
  return false
end

def occupy2(data, line_nb, col_nb)
  result = 0
  [-1, 0, 1].each do |dx|
    [-1, 0, 1].each do |dy|
      next if dx == 0 && dy == 0
      result +=1  if occupy3(data, line_nb, col_nb, dx, dy)
    end
  end
  result
end

def puzzle2(data)
  new_data = []
  data.each_with_index do |line, line_nb|
    line.split('').each_with_index do |cell, col_nb|
      new_data << '' if col_nb.zero?
      new_data[line_nb] +=
        case cell
        when '.'
          '.'
        when 'L'
          occupy2(data, line_nb, col_nb) == 0 ? '#' : 'L'
        when '#'
          occupy2(data, line_nb, col_nb) >= 5 ? 'L' : '#'
        end
    end
  end
  return data.join.count('#') if data == new_data

  puzzle2(new_data)
end
