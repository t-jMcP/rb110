VOWELS = 'aeiou'

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, value|
  value.each do |string|
    string.chars.each{ |char| puts char if VOWELS.include?(char)}
  end
end
