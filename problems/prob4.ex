defmodule Problem4 do

  def solve do
    solve(999, 999, 0)
  end

  defp solve(99, _, largest) do
    largest
  end

  defp solve(a, 99, largest) do
    solve(a-1, 999, largest)
  end

  defp solve(a, b, largest) do
    cond do
      a*b < largest ->
        solve(a-1, 999, largest)
      Utils.is_palindrome(a*b) ->
        solve(a-1, 999, a*b)
      true ->
        solve(a, b-1, largest)
    end
  end
end
