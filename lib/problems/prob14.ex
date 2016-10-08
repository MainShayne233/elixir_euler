defmodule Problem14 do

  def solve do
    (1..999999)
    |> Enum.map( &([&1, collatz_sequence(&1)]) )
    |> Enum.max_by( &(Enum.at(&1, 1)) )
    |> Enum.at(0)
  end

  def collatz_sequence(n) do
    collatz_sequence n, 1
  end

  def collatz_sequence(1, length) do
    length
  end

  def collatz_sequence(n, length) when rem(n, 2) == 0 do
    collatz_sequence div(n, 2), length + 1
  end

  def collatz_sequence(n, length) do
    collatz_sequence 3 * n + 1, length + 1
  end
end
