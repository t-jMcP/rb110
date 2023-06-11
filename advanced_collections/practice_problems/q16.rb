=begin Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Write a method that returns one UUID when called with no parameters
=end

HEXADECIMAL = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

def generate_uuid
  uuid = ""
  sections = [8, 4, 4, 4, 12]

  sections.each do |section|
    section.times{ uuid << HEXADECIMAL.sample }
    uuid << "-"
  end

  uuid.slice!(uuid.length - 1)
  uuid
end

puts generate_uuid
