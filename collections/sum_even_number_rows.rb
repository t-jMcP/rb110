def create_row(length, even_integer)
  row = []
  length.times do
    row.push(even_integer)
    even_integer += 2
  end
  row
end  


def sum_last_row(selected_row)
  rows = []
  even_integer = 2

  for row_number in (1..selected_row)
    rows << create_row(row_number, even_integer)
    even_integer = row.last + 2
  end

  sum = rows[selected_row - 1].sum
end


puts sum_last_row(1)
puts sum_last_row(2)
puts sum_last_row(3)
puts sum_last_row(4)
puts sum_last_row(5)
puts sum_last_row(100)
