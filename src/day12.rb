def read_file(name)
  file = File.open(name)
  file.readlines.map(&:chomp)
end

def compute(cmd, value, boat)
  position, direction = boat
  move = { 'N' => 1,
           'S' => -1,
           'E' => 1i,
           'W' => -1i,
           'F' => direction,
           'L' => 0,
           'R' => 0 } [cmd]

  cap = case cmd
        when 'L'
          case value
          when 90
            -1i
          when 180
            -1
          when 270
            1i
          end
        when 'R'
          case value
          when 90
            1i
          when 180
            -1
          when 270
            -1i
          end
        else
          1
        end
  [position + value*move, direction * cap]
end

def puzzle1(data)
  final, direction = data.inject([(0+0i),(0++1i)]) { |boat, cmd|
    compute(cmd[0], cmd[1..].to_i, boat)
  }
  final.imaginary.abs + final.real.abs
end

def compute2(cmd, value, boat)
  position, waypoint = boat
  move_waypoint = { 'N' => 1,
           'S' => -1,
           'E' => 1i,
           'W' => -1i,
           'F' => 0,
           'L' => 0,
           'R' => 0 } [cmd]

  move = cmd == 'F' ? 1 : 0

  cap = case cmd
        when 'L'
          case value
          when 90
            -1i
          when 180
            -1
          when 270
            1i
          end
        when 'R'
          case value
          when 90
            1i
          when 180
            -1
          when 270
            -1i
          end
        else
          1
        end
  [position + value*move*waypoint, (waypoint + move_waypoint * value) * cap]
end

def puzzle2(data)
  final, waypoint = data.inject([(0+0i),(1+10i)]) { |boat, cmd|
    compute2(cmd[0], cmd[1..].to_i, boat)
  }
  final.imaginary.abs + final.real.abs
end
