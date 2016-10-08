defmodule ElixirEuler.Mixfile do
  use Mix.Project
  def application do
    [applications: [:httpoison]]
  end

  def project do
    [app: :elixir_euler,
     version: "1.0.0",
     deps: deps]
  end

  defp deps do
     [
       {:httpoison, "~> 0.9.0"}
     ]
  end

end
