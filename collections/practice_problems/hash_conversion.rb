flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
names_hash = {}

flintstones.each_with_index do |value, index|
  names_hash[value] = index
end

p names_hash
