(0..333)
|> Enum.each(fn a ->
  (a..a+333)
  |> Enum.each(fn b ->
    c = 1000 - a - b
    if :math.pow(a, 2) + :math.pow(b, 2) == :math.pow(c, 2) do
      IO.inspect a*b*c
    end
  end)
end)
