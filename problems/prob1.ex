defmodule Problem1 do

  def solve do
    Utils.sum_list(multiples)
  end

  def multiples do
    for n <- 1..999, Utils.divisible_by_one?(n, [3,5]), do: n
  end

end
