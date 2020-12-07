def read_file(name)
  file = File.open(name)
  file.readlines.map(&:chomp)
end

def nb_question(group)
  group.join().split('').uniq.count
end

def puzzle1(data)
  data.join(' ').split('  ').inject(0) { |acc, group|
    acc + group.gsub(' ', '').split('').uniq.count
  }
end

def yes_answer(group)
  answers = group.split(' ')
  first = answers[0]
  answers.inject(first.split('')) { |acc, answer|
    acc & answer.split('')
  }.count
end

def puzzle2(data)
  data.join(' ').split('  ').inject(0) { |acc, group|
    acc + yes_answer(group)
  }

end
