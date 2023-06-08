def multiply_all_pairs(input_array1, input_array2)
  results = []

  input_array1.each do |num1|
    input_array2.each{ |num2| results << num1 * num2}
  end

  results.sort
end


puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
