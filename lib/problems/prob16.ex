defmodule Problem16 do

  def solve do
    number
    |> Util.digits
    |> Enum.sum
  end

  def number do
    :math.pow(2, 1000)
    |> round
  end

end
