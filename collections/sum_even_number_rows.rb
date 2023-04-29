def create_row(length, integer)
  row = []

  length.times do
    row.push(integer)
    integer += 2
  end

  row
end  


def sum_last_row(selected_row)
  rows = []
  even_integer = 2

  for row_number in (1..selected_row)
    row = create_row(row_number, even_integer)
    rows.push(row)
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
