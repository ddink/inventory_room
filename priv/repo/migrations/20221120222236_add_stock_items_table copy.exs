defmodule StoreRepo.Repo.Migrations.AddStockItemsTable do
  use Ecto.Migration

  def change do
    create table("stock_items") do
      add :stock_location_id, references(:stock_locations, on_delete: :nothing)
      add :variant_id, references(:variants, on_delete: :nothing)
      
      add :count_on_hand, :integer, default: 0, null: false
      add :backorderable, :boolean, default: false
      add :deleted_at, :naive_datetime
      timestamps()
    end
  end
end
