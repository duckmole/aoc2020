def read_file(name)
  file = File.open(name)
  file.readlines.map(&:chomp)
end

def line(data)
  {cmd: data.split(' ')[0], data: data.split(' ')[1].to_i, done: false}
end

def execute(index: , acc:, prog:)
  return [:end, acc] if index == prog.length
  return [:done, acc] if prog[index][:done]
  prog[index][:done] = true
  case prog[index][:cmd]
  when 'nop'
    execute(index: index+1, acc: acc, prog: prog)
  when 'acc'
    execute(index: index+1, acc: acc+prog[index][:data], prog: prog)
  when 'jmp'
    execute(index: index+prog[index][:data], acc: acc, prog: prog)
  end
end

def puzzle1(data)
  prog = data.map { |l| line(l) }
  result, value = execute(index: 0, acc: 0, prog: prog)
  value
end

def puzzle2(data)
  prog = data.map { |l| line(l) }
  prog.length.times do |index|
    next if prog[index][:cmd] == 'acc'
    prog[index][:cmd] = prog[index][:cmd] == 'jmp' ? 'nop' : 'jmp'
    result, value = execute(index: 0, acc: 0, prog: prog)
    return value if result == :end
    prog.each do |line|
      line[:done] = false
    end
    prog[index][:cmd] = prog[index][:cmd] == 'jmp' ? 'nop' : 'jmp'
  end
end
