def halvsies(input_array)
  halves = [[], []]

  input_array.each_with_index do |element, index|
    if index < input_array.length.to_f / 2
      halves[0].push(element)
    else
      halves[1].push(element)
    end
  end

  halves
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
