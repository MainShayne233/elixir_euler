defmodule Problem8 do

  def solve do
    matrix = data
    (0..986)
    |> Enum.map(fn start ->
      Enum.slice(matrix, start, 13)
      |> Util.product_of
    end)
    |> Enum.max
  end

  def data do
    Regex.scan(~r/\d{50}/, page)
    |> Enum.map(fn(row) ->
      row
      |> Enum.at(0)
      |> String.split("")
      |> Enum.take(50)
      |> Util.strings_to_integers
    end)
    |> List.flatten
  end

  def page do
    "https://projecteuler.net/problem=8"
    |> Util.get_html
    |> String.split("5832")
    |> Enum.at(1)
  end
end
