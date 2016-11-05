defmodule Problem18 do

  def solve do
    greatest_sum triangle, 15
  end

  def triangle do
    Regex.scan(~r/(\d\d) |(\d\d)</, page)
    |> Enum.take(120)
    |> Enum.map( &( List.last(&1) |> String.trim |> String.to_integer ) )
  end

  def page do
    "https://projecteuler.net/problem=18"
    |> Util.get_html
    |> String.split("Find the maximum total from top to bottom of the triangle below:")
    |> Enum.at(1)
  end

  def greatest_sum [sum], _ do
    sum
  end

  def greatest_sum triangle, row do
    new_top_of_triangle = triangle
    |> up_to_row(row - 2)

    new_bottom_of_triangle = triangle
    |> compacted_bottom_for(row)

    greatest_sum new_top_of_triangle ++ new_bottom_of_triangle, row-1
  end

  def compacted_bottom_for triangle, row do
    second_from_bottom_of_triangle = triangle
    |> second_from_bottom(row)

    addends = triangle
    |> addends_for(row)

    (0..row-2)
    |> Enum.map(&(
      Enum.at(second_from_bottom_of_triangle, &1) + Enum.at(addends, &1)
    ))
  end

  def addends_for triangle, row do
    triangle
    |> bottom(row)
    |> Enum.chunk(2,1)
    |> Enum.map(fn(chunk) ->
      Enum.max(chunk)
    end)
  end

  def up_to_row triangle, row do
    triangle
    |> Enum.take((0..row) |> Enum.sum)
  end

  def bottom triangle, row do
    triangle
    |> Enum.take(row * -1)
  end

  def second_from_bottom triangle, row do
    triangle
    |> Enum.take(row * -2 + 1)
    |> Enum.take(row-1)
  end
end
