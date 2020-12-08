def read_file(name)
  file = File.open(name)
  file.readlines.map(&:chomp)
end

def line(data)
  {cmd: data.split(' ')[0], data: data.split(' ')[1].to_i}
end

def execute(index: 0, acc: 0, prog:, lines: [])
  return [:end, acc] if index == prog.length
  return [:done, acc] if lines.include? index
  lines << index
  case prog[index][:cmd]
  when 'nop'
    execute(index: index+1, acc: acc, prog: prog, lines: lines)
  when 'acc'
    execute(index: index+1, acc: acc+prog[index][:data], prog: prog, lines: lines)
  when 'jmp'
    execute(index: index+prog[index][:data], acc: acc, prog: prog, lines: lines)
  end
end

def puzzle1(data)
  prog = data.map { |l| line(l) }
  result, value = execute(prog: prog)
  value
end

def switch(prog, index)
  prog[index][:cmd] = prog[index][:cmd] == 'jmp' ? 'nop' : 'jmp'
end

def puzzle2(data)
  prog = data.map { |l| line(l) }
  prog.length.times do |index|
    next if prog[index][:cmd] == 'acc'
    switch(prog, index)
    result, value = execute(prog: prog)
    return value if result == :end
    switch(prog, index)
  end
end
