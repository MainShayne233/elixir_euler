defmodule Fibonacci do

  def sequence_up_to(max) do
    sequence_up_to max, [1,2], 1, 2
  end

  defp sequence_up_to(max, seq, x, y) when x + y > max do
    seq
  end

  defp sequence_up_to(max, seq, x, y) do
    sequence_up_to max, seq ++ [x+y], y, x+y
  end

end
