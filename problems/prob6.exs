sqr_of_sum = (1..100) |>
             Enum.reduce(&(&1 + &2)) |>
             :math.pow(2)

sum_of_sqrs = (1..100) |>
              Enum.map(&(:math.pow(&1, 2))) |>
              Enum.reduce(&(&1 + &2))

sqr_of_sum - sum_of_sqrs
