def read_file(name)
  file = File.open(name)
  file.readlines.map(&:chomp)
end

def translate(values)
  return [] if values == 'no other bags.'
  result = []
  values.split(', ').each do |value|
    m = value.match(/(\d*) (.*) bag.*/)
    result << [m[1].to_i, m[2]]
  end
  result
end

def all_parents(parents, bag, acc: [])
  acc << parents[bag]
  parents.fetch(bag, []).each do |parent_bag|
    all_parents(parents, parent_bag, acc: acc)
  end
  acc.flatten.uniq.compact.sort
end

def bag_parents(data)
  parents = {}
  data.each do |line|
    parent, children = line.split(' bags contain ')
    translate(children).each do |nb, child|
      parents[child] = parents.fetch(child, []) + [parent]
    end
  end
  parents
end

def bag_children(data)
  result = {}
  data.each do |line|
    parent, children = line.split(' bags contain ')
    translate(children).each do |nb, child|
      result[parent] = result.fetch(parent, {}).merge({child => nb})
    end
  end
  result
end

def all_children(children, bag)
  return 0 unless children.has_key? bag
  children[bag].values.sum+children[bag].keys.inject(0) { |acc, key|
    acc + children[bag][key] * all_children(children, key)
  }
end

def puzzle1(data)
  parents = bag_parents(data)
  all_parents(parents, 'shiny gold').count
end

def puzzle2(data)
  children = bag_children(data)
  all_children(children, 'shiny gold')
end
