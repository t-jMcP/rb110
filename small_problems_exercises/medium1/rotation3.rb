=begin
1. Initialise a variable `digits_to_rotate` and assign it to the number of digits in `number`
2. Until `digits_to_rotate` equals 0
   1. Assign `number` to the return value of invoking `rotate_rightmost_digits`, passing in `number` and the `digits_to_rotate` as arguments
   2. Reduce `digits_to_rotate` by 1
3. Return `number`
=end

def max_rotation(number)
  digits_to_rotate = number.digits.length
  
  loop do
    break number if digits_to_rotate == 1
    number = rotate_rightmost_digits(number, digits_to_rotate)
    digits_to_rotate -= 1
  end
end

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


puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
