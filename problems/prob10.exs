defmodule Problem10 do

  def solve do
    Prime.all_up_to(2000000)
    |> Util.sum_of
  end
end
