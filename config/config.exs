import Config

config :inventory_room, ecto_repos: [InventoryRoom.Repo]

config :inventory_room, InventoryRoom.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  database: "inventory_room_db",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"

import_config("#{Mix.env()}.exs")
