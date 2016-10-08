defmodule Problem12 do

  def solve do
    triangle_number_check 1
  end

  def triangle_number_check n do
    triangle_number = Util.nth_triangle_number n
    divisors = Util.divisors_count triangle_number
    if divisors < 500, do: triangle_number_check(n+1), else: triangle_number
  end
end
