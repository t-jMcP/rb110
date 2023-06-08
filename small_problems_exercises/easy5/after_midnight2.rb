HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 1440

def after_midnight(time)
  hours, minutes = time.split(':').map {|string| string.to_i}
  hours % HOURS_PER_DAY * MINUTES_PER_HOUR + minutes
end

def before_midnight(time)
  (MINUTES_PER_DAY - after_midnight(time)) % MINUTES_PER_DAY
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
