def find_fibonacci_index_by_length(length)
  sequence = [1, 1]
  index = 2

  until sequence.last.digits.length == length
    sequence << sequence[index - 1] + sequence[index - 2]
    index += 1
  end

  index
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
