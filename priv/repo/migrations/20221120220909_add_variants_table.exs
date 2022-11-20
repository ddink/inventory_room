defmodule StoreRepo.Repo.Migrations.AddVariantsTable do
  use Ecto.Migration

  def change do
    create table("variants") do
      add :sku, :string, default: "", null: false
      add :weight, :decimal, precision: 8, scale: 2, default: 0.0
      add :height, :decimal, precision: 8, scale: 2
      add :width, :decimal, precision: 8, scale: 2
      add :depth, :decimal, precision: 8, scale: 2
      add :deleted_at, :naive_datetime
      add :is_master, :boolean, default: false

      add :product_id, references(:products, on_delete: :nothing)

      add :cost_price, :decimal, precision: 10, scale: 2
      add :position, :integer
      add :cost_currency, :string
      add :track_inventory, :boolean, default: true
      timestamps()
    end
  end
end
