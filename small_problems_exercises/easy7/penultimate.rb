def penultimate(input_string)
  words = input_string.split
  words[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'
