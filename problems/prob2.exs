require Fibonacci

Fibonacci.sequence_up_to(4000000) |>
Enum.filter(&(rem(&1, 2) == 0)) |>
Enum.reduce(&(&1 + &2))
