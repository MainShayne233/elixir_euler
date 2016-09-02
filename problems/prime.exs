defmodule Prime do

  def is?(1), do: false

  def is?(2), do: true

  def is?(n) do
    is?(n, 2)
  end

  def is?(n, fac) when fac*fac > n do
    true
  end

  def is?(n, fac) when rem(n, fac) == 0 do
     false
  end

  def is?(n, fac) do
    is?(n, fac+1)
  end

  def next(n) when rem(n, 2) == 0 do
    if (is?(n+1)), do: n+1, else: next(n+1)
  end

  def next(n) do
    if (is?(n+2)), do: n+2, else: next(n+2)
  end

  def factorization(n) do
    factorization %{}, n, 2
  end

  def factorization(factors, n, prime) when prime > n do
    factors
  end

  def factorization(factors, n, prime) when rem(n, prime) == 0 do
     factors |>
     Map.update(prime, 1, &(&1 + 1)) |>
     factorization(div(n, prime), prime)
  end

  def factorization(factors, n, prime) do
    factorization(factors, n, next(prime))
  end

  def nth(n), do: nth n, 1, 2

  def nth(n, n, prime), do: prime

  def nth(n, x, prime), do: nth n, x+1, next(prime)

end
