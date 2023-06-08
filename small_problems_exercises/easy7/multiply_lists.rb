def multiply_list(input_array1, input_array2)
  input_array1.zip(input_array2).map { |arr| arr.inject(:*) }
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
