defmodule InventoryRoom.MixProject do
  use Mix.Project

  def project do
    [
      app: :inventory_room,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps()
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test"]
  defp elixirc_paths(_), do: ["lib"]  

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {InventoryRoom.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.4"},
      {:ecto_sql, "~> 3.9"},
      {:ex_machina, "~> 2.7"},
      {:postgrex, "~> 0.16.5"},
      {:faker, "~> 0.17.0", only: [:test, :dev]}
    ]
  end
end
