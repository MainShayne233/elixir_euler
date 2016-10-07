defmodule Problem1 do

  def solve do
    (3..999)
    |> Util.only_multiples_of([3,5])
    |> Util.sum_of
  end

end
