defmodule Problem19 do

  def solve do
    {1901, 1, 1}
    |> first_of_the_month_sundays_til({2000, 12, 31}, 0)
  end

  def first_of_the_month_sundays_til(date, til, sundays) when date == til, do: sundays

  def first_of_the_month_sundays_til({year, month, 1}, til, sundays) do
    case Calendar.Date.day_of_week_name({year, month, 1}) do
      "Sunday" ->
        {year, month, 2}
        |> first_of_the_month_sundays_til(til, sundays + 1)
      _ ->
        {year, month, 2}
        |> first_of_the_month_sundays_til(til, sundays)
    end
  end

  def first_of_the_month_sundays_til(date, til, sundays) do
    Calendar.Date.next_day!(date)
    |> Date.to_erl
    |> first_of_the_month_sundays_til(til, sundays)
  end

end
