defmodule Problem3 do

   def solve do
     600851475143
     |> Prime.factorization
     |> Map.keys
     |> Enum.max
   end
end
