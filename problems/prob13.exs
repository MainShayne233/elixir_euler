defmodule Problem13 do

  def solve do
    data
    |> Enum.sum
    |> Integer.to_string
    |> String.slice(0..9)
    |> String.to_integer
  end

  def data do
    Regex.scan(~r/\d{50}/, page)
    |> Enum.map(fn(row) ->
      row
      |> Enum.at(0)
    end)
    |> List.flatten
    |> Util.strings_to_integers
  end

  def page do
    "https://projecteuler.net/problem=13"
    |> Util.get_html
  end
end
