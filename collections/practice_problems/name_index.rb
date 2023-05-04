flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

string_index = 0

flintstones.each_with_index do |name, index|
  if name.start_with? ("Be")
    string_index = index
    break
  end  
end

puts string_index
