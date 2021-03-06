defmodule Problem6 do

  def solve do
    square_of_sum - sum_of_sqares
  end

  def square_of_sum do
    (1..100)
    |> Enum.sum
    |> :math.pow(2)
    |> round
  end

  def sum_of_sqares do
    (1..100)
    |> Enum.map( &(:math.pow(&1, 2)) )
    |> Enum.sum
    |> round
  end
end
