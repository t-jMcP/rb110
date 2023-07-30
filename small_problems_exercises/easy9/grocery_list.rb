def buy_fruit(input_list)
  input_list.each_with_object([]) do |fruit, output_list|
    fruit[1].times { output_list << fruit[0] }
  end
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
