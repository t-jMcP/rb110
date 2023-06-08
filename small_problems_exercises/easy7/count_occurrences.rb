def count_occurrences(input_array)
  counts = input_array.each_with_object({}) do |word, counts|
    if counts.key?(word)
      counts[word] += 1
    else
      counts[word] = 1
    end
  end

  counts.each{|key, value| puts "#{key} => #{value}"}
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
  