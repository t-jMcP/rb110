def running_total(numbers)
  running_totals = []
  counter = 0

  while counter < numbers.length
    running_totals << numbers.take(counter + 1).inject(:+)
    counter += 1
  end

  running_totals
end


puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
