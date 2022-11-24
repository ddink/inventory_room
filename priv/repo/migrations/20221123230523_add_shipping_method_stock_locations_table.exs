defmodule StoreRepo.Repo.Migrations.AddShippingMethodStockLocationsTable do
  use Ecto.Migration

  def change do
    create table("shipping_method_stock_locations") do
      add :shipping_method_id, references(:shipping_methods)
      add :stock_location_id, references(:stock_locations)
      timestamps()
    end
  end
end
