defmodule Util do

  def sum_of enumeration do
    enumeration
    |> Enum.reduce( &(&1 + &2) )
  end

  def product_of enumeration do
    enumeration
    |> Enum.reduce(1, &(&1 * &2) )
  end

  def only_multiples_of enumeration, multiples do
    enumeration
    |> Enum.filter(fn (x) ->
      multiples
      |> Enum.any?( &(rem(x, &1) == 0) )
    end)
  end

  def only_evens enumeration do
    enumeration
    |> only_multiples_of([2])
  end

  def only_odds enumeration do
    enumeration
    |> Enum.filter( &(rem(&1, 2) == 1) )
  end

  def palindrome? num, :integer do
    string = Integer.to_string(num)
    String.reverse(string) == string
  end

  def palindrome? string do
    string
    |> String.reverse == string
  end

  def strings_to_integers enumeration do
    enumeration
    |> Enum.map( &(String.to_integer(&1)) )
  end

  def integers_to_strings enumeration do
    enumeration
    |> Enum.map( &(Integer.to_string(&1)) )
  end

  def get_html url do
    url
    |> HTTPoison.get!
    |> Map.get(:body)
  end

end
