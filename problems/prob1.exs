(3..999) |>
Enum.filter(&(rem(&1, 3) == 0 or rem(&1, 5) == 0)) |>
Enum.reduce(&(&1 + &2)) |>
IO.inspect
