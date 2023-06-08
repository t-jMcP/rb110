MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def normalise_minutes(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end
  minutes % MINUTES_PER_DAY
end

def time_of_day(minutes)
  delta_minutes = normalise_minutes (minutes)
  hour, minute = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hour, minute)
end  

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
