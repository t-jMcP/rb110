=begin 
1. Initialise a variable `left` to reference an array of the first half of the number’s digits
2. Create a variable `right` to reference an array of the second half of the number’s digits
3. If `right` and `left` are identical, return `input_number`
4. Else return `input_number` doubled
=end

def twice(input_number)
  digits = input_number.digits.reverse

  left = digits[0..(digits.length/2 - 1)]
  right = digits[digits.length/2..-1]

  if left == right && digits.length > 1
    input_number
  else
    input_number * 2
  end
end


puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
