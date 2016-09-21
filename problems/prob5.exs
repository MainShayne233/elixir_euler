require Prime

(1..20) |>
Enum.map(&(Prime.factorization(&1))) |>
Enum.reduce(%{}, fn (x, map) ->
  Map.merge x, map, fn (_k, v1, v2) -> if (v1 > v2), do: v1, else: v2 end
end) |>
Enum.map( fn ({prime, amt}) -> :math.pow(prime, amt) end) |>
Enum.reduce(&(&1 * &2)) |>
round |>
IO.inspect
