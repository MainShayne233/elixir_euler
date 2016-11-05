defmodule Problem17 do

  def solve do
    (1..1000)
    |> Enum.map( &(word_for(&1)) )
    |> Enum.map( &(letter_count_for(&1)) )
    |> Enum.sum
  end

  def letter_count_for word do
    Regex.scan(~r/\w/, word)
    |> Enum.count
  end

  def word_for(number) when number == 1000 do
    "one thousand"
  end

  def word_for(number) when number > 99 do
    hundred_digit = div(number, 100)
    |> word_for

    case rem(number, 100) do
      0 ->
        "#{hundred_digit} hundred"
      remainder ->
        "#{hundred_digit} hundred and #{word_for(remainder)}"
    end
  end

  def word_for(number) when rem(number, 10) == 0 do
    [
      "ten",
      "twenty",
      "thirty",
      "forty",
      "fifty",
      "sixty",
      "seventy",
      "eighty",
      "ninety"
    ]
    |> Enum.at(div(number, 10) - 1)
  end

  def word_for(number) when number > 19 do
    ten_digit = div(number, 10) * 10
    |> word_for

    case rem(number, 10) do
      0 ->
        ten_digit
      remainder ->
        "#{ten_digit}-#{word_for(remainder)}"
    end
  end

  def word_for(number) when number > 12 do
    [
      "thirteen",
      "fourteen",
      "fifteen",
      "sixteen",
      "seventeen",
      "eighteen",
      "nineteen"
    ]
    |> Enum.at(number - 13)
  end

  def word_for(number) when number < 13 do
    [
      "zero",
      "one",
      "two",
      "three",
      "four",
      "five",
      "six",
      "seven",
      "eight",
      "nine",
      "ten",
      "eleven",
      "twelve"
    ]
    |> Enum.at(number)
  end
end
