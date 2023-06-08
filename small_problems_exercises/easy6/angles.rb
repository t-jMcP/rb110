DEGREE = "\xC2\xB0"

def dms(angle)
  degrees = angle.to_i

  minutes_int, minutes_float = convert_sixtieths(angle, degrees)
  formatted_minutes = angle_format(minutes_int)

  seconds_int = convert_sixtieths(minutes_float, minutes_int)[0]
  formatted_seconds = angle_format(seconds_int)

  "#{degrees}" + DEGREE + formatted_minutes + "'" + formatted_seconds + '"'
end

def convert_sixtieths(input_decimal, input_int)
  sixtieth_float = input_int == 0 ? 0 : (input_decimal % input_int) * 60
  sixtieth_int = sixtieth_float.to_i
  [sixtieth_int, sixtieth_float]
end

def angle_format(integer)
  string = integer.to_s
  string.prepend('0') if integer < 10
  string
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°35'59")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
