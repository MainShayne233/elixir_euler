defmodule Problem22 do

  def solve do
    names = String.split(txt, ",")
    |> Enum.sort
    (0..Enum.count(names)-1)
    |> Enum.map(fn (name_index) ->
      Enum.at(names, name_index)
      |> name_value(name_index)
    end)
    |> Enum.sum
  end

  def name_value(name, index) do
    sum = String.replace(name, "\"", "")
    |> String.codepoints
    |> Enum.map(fn (letter) ->
      alphabetical_value(letter)
    end)
    |> Enum.sum
    sum * (index+1)
  end

  def txt do
    "https://projecteuler.net/project/resources/p022_names.txt"
    |> Util.get_html
  end

  def alphabetical_value(letter) do
    [
      "A": 1,
      "B": 2,
      "C": 3,
      "D": 4,
      "E": 5,
      "F": 6,
      "G": 7,
      "H": 8,
      "I": 9,
      "J": 10,
      "K": 11,
      "L": 12,
      "M": 13,
      "N": 14,
      "O": 15,
      "P": 16,
      "Q": 17,
      "R": 18,
      "S": 19,
      "T": 20,
      "U": 21,
      "V": 22,
      "W": 23,
      "X": 24,
      "Y": 25,
      "Z": 26
    ][String.to_atom(letter)]
  end
end
