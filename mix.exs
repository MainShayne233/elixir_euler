defmodule ElixirEuler.Mixfile do
  use Mix.Project
  def application do
    [applications: [:floki, :httpoison]]
  end

  def project do
    [app: :elixir_euler,
     version: "1.0.0",
     deps: deps]
  end

  defp deps do
     [
       {:floki, "~> 0.10.1"},
       {:httpoison, "~> 0.9.0"}
     ]
  end

end
