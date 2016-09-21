matrix = File.read!("data/prob8_data.txt")
|> String.split("")
|> Enum.filter_map(
  &(String.match?(&1, ~r/\d/)),
  &(String.to_integer(&1))
)

(0..986)
|> Enum.map(fn start ->
  Enum.slice(matrix, start, 13)
  |> Enum.reduce(1, &(&1 * &2))
end)
|> Enum.max
