defmodule Prime do

  def is?(x) when x <= 3, do: x >= 2
  def is?(5), do: true

  def is?(x) when x > 3 do
    if gcd(x, 30) == 1 do
      sqrt = (:math.sqrt(x) |> Float.round)
      check(x, 7, sqrt)
    else
      false
    end
  end

  def check(_, p, sqrt) when p > sqrt, do: true

  def check(x, p, sqrt) do
    isnt = rem(x, p)    == 0 or rem(x, p+4)  == 0 or rem(x, p+6)  == 0 or
           rem(x, p+10) == 0 or rem(x, p+12) == 0 or rem(x, p+16) == 0 or
           rem(x, p+22) == 0 or rem(x, p+24) == 0

    if isnt, do: false, else: check(x, p+30, sqrt)
  end

  def gcd(0, y), do: y
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x,y))

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

  def all_up_to(n), do: all_up_to n, 3, [2]

  def all_up_to(n, next_prime, primes) when next_prime >= n, do: primes

  def all_up_to(n, next_prime, primes) do
    all_up_to n, Prime.next(next_prime), primes ++ [next_prime]
  end


end
