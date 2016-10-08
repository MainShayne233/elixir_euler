defmodule Problem9 do

  def solve do
    pythagorean_triplet = triples
    |> Enum.find(fn (triple) ->
      :math.pow(triple.a, 2) + :math.pow(triple.b, 2) == :math.pow(triple.c, 2)
    end)
    pythagorean_triplet.a * pythagorean_triplet.b * pythagorean_triplet.c
  end

  def triples do
    (0..333)
    |> Enum.map(fn a ->
      (a..a+333)
      |> Enum.map(fn b ->
        %{
          a: a,
          b: b,
          c: 1000 - a - b
        }
      end)
    end)
    |> List.flatten
  end
end
