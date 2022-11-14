import Config

config :inventory_room, InventoryRoom.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  database: "inventory_room_db_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"

config :logger, :console, level: :warn
