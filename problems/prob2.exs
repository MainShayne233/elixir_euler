defmodule Problem2 do

  def solve do
    Fibonacci.sequence_up_to(4000000)
    |> Util.only_evens
    |> Util.sum_of
  end
end
