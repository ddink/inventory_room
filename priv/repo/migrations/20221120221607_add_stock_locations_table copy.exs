defmodule StoreRepo.Repo.Migrations.AddStockLocationsTable do
  use Ecto.Migration

  def change do
    create table("stock_locations") do
      add :name, :string
      add :default, :boolean, default: false, null: false
      add :address1, :string
      add :address2, :string
      add :city, :string
      add :zipcode, :string
      add :phone, :string
      add :active, :boolean, default: true
      add :backorderable_default, :boolean, default: false
      add :propagate_all_variants, :boolean, default: true
      add :internal_name, :string
      add :position, :integer, default: 0
      add :restock_inventory, :boolean, default: true, null: false
      add :fulfillable, :boolean, default: true, null: false
      add :code, :string
      add :check_stock_on_transfer, :boolean, default: true
      timestamps()
    end
  end
end
