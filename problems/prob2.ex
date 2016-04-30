defmodule Problem2 do

  def solve do
    Utils.sum_list(even_fibs)
  end

  def even_fibs do
    Utils.only_evens(fib_under_4_mil)
  end

  def fib_under_4_mil do
    for n <- Utils.fib_seq_up_to(4 * Utils.pow(10, 6)), do: n
  end

end
