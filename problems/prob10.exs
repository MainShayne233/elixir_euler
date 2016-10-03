Prime.all_up_to(2000000)
|> Enum.reduce( &(&1 + &2) )
|> IO.inspect
