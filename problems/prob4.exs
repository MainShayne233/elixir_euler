palindrome? = fn (n) ->
  str = Integer.to_string(n)
  str == String.reverse str
end

(100..999) |>
Enum.map(fn (x) ->
  (x..999) |>
  Enum.map(&(&1 * x))
end) |>
List.flatten |>
Enum.filter(palindrome?) |>
Enum.max |>
IO.inspect
