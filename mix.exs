defmodule InventoryRoom.MixProject do
  use Mix.Project

  def project do
    [
      app: :inventory_room,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
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
      extra_applications: [:logger, :shopping_cart, :store_repo],
      # mod: {InventoryRoom.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.4"},
      {:ecto_sql, "~> 3.9"},
      {:ex_machina, "~> 2.7"},
      {:postgrex, "~> 0.16.5"},
      {:faker, "~> 0.17.0", only: [:test, :dev]},
      {:faker_elixir_octopus, "~> 1.0"},
      {:countries, "~> 1.6"},
      {:uploadex, "~> 3.0"},
      {:shopping_cart, in_umbrella: true},
      {:store_repo, in_umbrella: true}
    ]
  end
end
