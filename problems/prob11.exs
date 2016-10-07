defmodule Problem11 do

  def solve do
    [
      largest_horizontal(data),
      largest_vertical(data),
      largest_down_right(data),
      largest_up_left(data)
    ]
    |> Enum.max
  end

  def data do
    Regex.scan(~r/(\d\d) |(\d\d)</, page)
    |> Enum.take(400)
    |> Enum.map( &( List.last(&1) |> String.trim |> String.to_integer ) )
  end

  def page do
    "https://projecteuler.net/problem=11"
    |> Util.get_html
    |> String.split("red.")
    |> Enum.at(1)
  end

  def largest_horizontal data do
    (0..19)
    |> Enum.map(fn row ->
      (0..16)
      |> Enum.map(fn col ->
        (0..3)
        |> Enum.map( &(Enum.at(data, row*20 + col + &1)) )
        |> Util.product_of
      end)
      |> Enum.max
    end)
    |> Enum.max
  end

  def largest_vertical data do
    (0..16)
    |> Enum.map(fn row ->
      (0..19)
      |> Enum.map(fn col ->
        (0..3)
        |> Enum.map( &(Enum.at(data, row*20 + col + &1*20)) )
        |> Util.product_of
      end)
      |> Enum.max
    end)
    |> Enum.max
  end

  def largest_down_right data do
    (0..16)
    |> Enum.map(fn row ->
      (0..16)
      |> Enum.map(fn col ->
        (0..3)
        |> Enum.map( &(Enum.at(data, row*20 + col + &1*21)) )
        |> Util.product_of
      end)
      |> Enum.max
    end)
    |> Enum.max
  end

  def largest_up_left data do
    (0..16)
    |> Enum.map(fn row ->
      (0..16)
      |> Enum.map(fn col ->
        (0..3)
        |> Enum.map( &(Enum.at(data, (row+3)*20 + col - &1*19)) )
        |> Util.product_of
      end)
      |> Enum.max
    end)
    |> Enum.max
  end

end
