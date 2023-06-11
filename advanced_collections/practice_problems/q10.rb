array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

p (array.map do |hash|
  hash.each_with_object({}) { |(sym, num), new_hash| new_hash[sym] = num + 1 }
end)

p array
