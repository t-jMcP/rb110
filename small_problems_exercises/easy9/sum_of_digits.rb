=begin
1. Split `input_number` into an array of its digits called `digits`
2. Initialise a variable `running_sum` to reference the integer value 0
3. For each `digit` in `digits`
   1. Increment `running_sum` by its value
4. Return `running_sum`
=end

def sum(input_number)
  digits = input_number.digits
  digits.reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
