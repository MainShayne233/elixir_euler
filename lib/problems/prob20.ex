defmodule Problem20 do

  def solve do
    factorial(100)
    |> Integer.digits
    |> Enum.sum
  end

  def factorial(1), do: 1
  def factorial(n), do: n * factorial(n-1)

end
