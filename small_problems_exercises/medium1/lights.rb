=begin
1. Initialise a variable `lights` to reference a hash with its keys as every number between 1 and `n` and each value as `'false'`
2. For each `num` from `1` to `n`
   1. For each `light` in `lights`
      1. If `light`’s key is a multiple of `num`, convert its value to its boolean opposite
3. For each `light` in `lights`
   1. Add its key to a new array `on_lights` if its value is `true`
=end

def switch_lights(n)
  lights = {}
  (1..n).each { |num| lights[num] = false }

  (1..n).each do |round|
    lights.each { |num, status| lights[num] = !status if num % round == 0 }
  end

  lights.select { |_, value| value }.keys
end
      

puts switch_lights(5) == [1, 4]
puts switch_lights(10) == [1, 4, 9]
