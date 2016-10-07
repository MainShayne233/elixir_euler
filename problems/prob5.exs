defmodule Problem5 do

  def solve do
    (1..20)
    |> prime_factorizations_of
    |> merge_factorizations
    |> raised_primes
    |> Util.product_of
    |> round
  end

  def prime_factorizations_of enumeration do
    enumeration
    |> Enum.map( &(Prime.factorization(&1)) )
  end

  def merge_factorizations enumeration do
    enumeration
    |> Enum.reduce(%{}, fn (x, map) ->
      Map.merge(x, map, fn (_k, v1, v2) ->
        if (v1 > v2), do: v1, else: v2
      end)
    end)
  end

  def raised_primes enumeration do
    enumeration
    |> Enum.map(fn ({prime, amt}) ->
      :math.pow(prime, amt)
    end)
  end

end
