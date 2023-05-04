statement = "The Flintstones Rock"
statement_condensed = statement.delete(" ")

letter_counts = {}
counter = 0

while counter < statement_condensed.length
  if letter_counts.key?(statement_condensed[counter])
    letter_counts[statement_condensed[counter]] += 1
  else
    letter_counts[statement_condensed[counter]] = 1
  end
  counter += 1
end

p letter_counts
