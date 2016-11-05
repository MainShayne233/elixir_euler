defmodule Problem21 do

  def solve do
    (1..10000)
    |> Enum.filter( &( amicable?(&1) ) )
    |> Enum.sum
  end


  def amicable?(n) do
    sum = sum_of_divisors(n)
    sum != n and
    sum_of_divisors(sum) == n
  end

  def sum_of_divisors(n) do
    divisors(n)
    |> Enum.sum
  end

  def divisors(n) when div(n, 2) == 0, do: []
  def divisors(n) do
    (1..div(n, 2))
    |> Enum.filter(fn (x) -> rem(n, x) == 0 end)
  end

end
