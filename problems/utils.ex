defmodule Utils do

  def sum_list([head | tail]) do
    sum_list(tail, head)
  end

  defp sum_list([head | tail], sum) do
    sum_list(tail, sum + head)
  end

  defp sum_list([], sum) do
    sum
  end

  def divisible_by_all?(x, [head | tail]) do
    divisible_by_all?(x, tail, rem(x, head))
  end

  defp divisible_by_all?(_, [], 0) do
    true
  end

  defp divisible_by_all?(x, [head | tail], 0) do
    divisible_by_all?(x, tail, rem(x, head))
  end

  defp divisible_by_all?(_, _, _) do
    false
  end


  def empty?([]) do
    true
  end

  def empty?(_) do
    false
  end

  def divisible_by_one?(x, [head | tail]) do
    divisible = for n <- [head | tail], rem(x, n) == 0, do: n
    !empty?(divisible)
  end

  def fib_seq_up_to(max) do
    fib_seq_up_to(max, [1,1])
  end

  defp fib_seq_up_to(max, seq) do
    length = count(seq)
    nth_value = nth_value(seq, length-1) + nth_value(seq, length-2)
    cond do
      nth_value > max ->
        seq
      nth_value == max ->
        seq ++ [nth_value]
      nth_value < max ->
        fib_seq_up_to(max, seq ++ [nth_value])
    end
  end

  def count(list) do
    count(list, 0)
  end

  defp count([], acc) do
    acc
  end

  defp count([_ | tail], acc) do
    count(tail, acc+1)
  end

  def nth_value([head | tail], n) do
    nth_value([head | tail], n, 0)
  end

  defp nth_value([head | tail], n, k) do
    if n == k do
      head
    else
      nth_value(tail, n, k+1)
    end
  end

  def pow(0, _) do
    0
  end

  def pow(_, 0) do
    1
  end

  def pow(x, y) do
    pow(x, y, x)
  end

  defp pow(_, 1, p) do
    p
  end

  defp pow(x, y, p) do
    pow(x, y-1, p*x)
  end

  def only_evens(list) do
    for n <- list, rem(n, 2) == 0, do: n
  end

  def is_prime?(1) do
    false
  end

  def is_prime?(n) do
    is_prime?(n, 2, 1)
  end

  defp is_prime?(_, _, 0) do
    false
  end

  defp is_prime?(x, f, _) do
    if f*f > x do
      true
    else
      is_prime?(x, f+1, rem(x, f))
    end
  end

  def next_prime(n) do
    _next_prime(n+1)
  end

  defp _next_prime(n) do
    if is_prime?(n) do
      n
    else
      _next_prime(n+1)
    end
  end

  def prime_factorization(n) do
    factors = %{}
    prime_factorization(n, 2, factors)
  end

  defp prime_factorization(n, p, factors) do
    if p*p > n do
      factors
    else
      if is_div?(n, p) do
        prime_factorization(n/p, p, add_or_update(factors, p))
      else
        prime_factorization(n, next_prime(p), factors)
      end
    end
  end

  def add_or_update(map, n) do
    if !!map[:Integern] do
      Map.merge(map, %{n: 1})
    else
      %{map | n: map[:n] + 1}
    end
  end

  def is_div?(x, y) do
    rem(x, y) == 0
  end



















end
