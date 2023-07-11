def sum_of_sums(input_array)
  running_total = 0

  input_array.each do |num|
    subsequence = input_array.slice(0, input_array.index(num) + 1)
    running_total += subsequence.sum
  end

  running_total
end


puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35
