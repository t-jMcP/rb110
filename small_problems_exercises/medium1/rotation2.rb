=begin
1. Create a variable `digits` that references the return value of splitting `input_number`into its individual digits
2. Invoke `rotate_array` passing in an array containing the last `n` digits from `digits`, assigning the return value to a new variable `rotated_digits`
3. Concatenate the first `digits.length` - `n` digits from `digits` with `rotated_digits`, then join the digits together and convert to an integer
=end

def rotate_rightmost_digits(input_number, n)
  digits = input_number.digits.reverse
  right_digits = digits.pop(n)
  rotated_digits = rotate_array(right_digits)
  (digits + rotated_digits).join.to_i
end

def rotate_array(input_array)
  rotated_array = []

  input_array.each_with_index do |element, index|
    next if index == 0
    rotated_array.push(element)
  end
  
  rotated_array.push(input_array[0])
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917
