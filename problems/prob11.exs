page = "https://projecteuler.net/problem=11"
|> HTTPoison.get!
|> Map.get(:body)
|> String.split("red.")
|> Enum.at(1)

data = Regex.scan(~r/(\d\d) |(\d\d)</, page)
|> Enum.take(400)
|> IO.inspect
|> Enum.map( &( List.last(&1) |> String.trim |> String.to_integer ) )


largest_horizontal = (0..19)
|> Enum.map(fn row ->
  (0..16)
  |> Enum.map(fn col ->
    (0..3)
    |> Enum.map( &(Enum.at(data, row*20 + col + &1)) )
    |> Enum.reduce(1, &(&1 * &2) )
  end)
  |> Enum.max
end)
|> Enum.max

largest_vertical = (0..16)
|> Enum.map(fn row ->
  (0..19)
  |> Enum.map(fn col ->
    (0..3)
    |> Enum.map( &(Enum.at(data, row*20 + col + &1*20)) )
    |> Enum.reduce(1, &(&1 * &2) )
  end)
  |> Enum.max
end)
|> Enum.max

largest_down_right = (0..16)
|> Enum.map(fn row ->
  (0..16)
  |> Enum.map(fn col ->
    (0..3)
    |> Enum.map( &(Enum.at(data, row*20 + col + &1*21)) )
    |> Enum.reduce(1, &(&1 * &2) )
  end)
  |> Enum.max
end)
|> Enum.max

largest_up_left = (0..16)
|> Enum.map(fn row ->
  (0..16)
  |> Enum.map(fn col ->
    (0..3)
    |> Enum.map( &(Enum.at(data, (row+3)*20 + col - &1*19)) )
    |> Enum.reduce(1, &(&1 * &2) )
  end)
  |> Enum.max
end)
|> Enum.max

[
  largest_horizontal,
  largest_vertical,
  largest_down_right,
  largest_up_left
]
|> Enum.max
|> IO.inspect
