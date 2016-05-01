defmodule Problem3 do

  def solve do
    List.last(Map.keys(Utils.prime_factorization(600851475143)))
  end
  
end
