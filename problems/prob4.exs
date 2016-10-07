defmodule Problem4 do

  def solve do
    products
    |> only_palindromes
    |> Enum.max
  end

  def products do
    (100..999)
    |> Enum.map(fn (x) ->
      (x..999)
      |> Enum.map(&(&1 * x))
    end)
    |> List.flatten
  end

  def only_palindromes enumeration do
    enumeration
    |> Enum.filter(&(
      Util.palindrome?(&1, :integer)
    ))
  end

end
