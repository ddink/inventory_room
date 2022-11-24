defmodule StoreRepo.Repo.Migrations.AddShipmentsTable do
  use Ecto.Migration

  def change do
    create table("shipments") do
      add :tracking_number, :string
      add :cost, :decimal, precision: 10, scale: 2, default: "0.0"
      add :shipped_at, :naive_datetime
      add :state, :string
      add :adjustment_total, :decimal, precision: 10, scale: 2, default: "0.0"
      add :additional_tax_total, :decimal, precision: 10, scale: 2, default: "0.0"
      add :promo_total, :decimal, precision: 10, scale: 2, default: "0.0"
      add :included_tax_total, :decimal, precision: 10, scale: 2, default: "0.0", null: false
      add :order_id, references(:orders)
      add :stock_location_id, references(:stock_locations)
      timestamps()
    end
  end
end
