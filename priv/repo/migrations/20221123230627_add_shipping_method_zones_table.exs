defmodule StoreRepo.Repo.Migrations.AddShippingMethodZonesTable do
  use Ecto.Migration

  def change do
    create table("shipping_method_zones") do
      add :shipping_method_id, references(:shipping_methods)
      add :zone_id, references(:zones)
      timestamps()
    end
  end
end
