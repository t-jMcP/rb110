def show_multiplicative_average(input_array)
  multiplied_result = input_array.inject(:*).to_f
  multiplied_average = multiplied_result / input_array.length
  puts "#{format('%.3f', multiplied_average)}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
