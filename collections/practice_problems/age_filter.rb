ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

filtered_ages = ages.select do |name, age|
  age < 100
end

p filtered_ages
