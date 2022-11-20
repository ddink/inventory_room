defmodule StoreRepo.Repo.Migrations.AddTaxRatesTable do
  use Ecto.Migration

  def change do
    create table("tax_rates") do
      add :amount, :decimal, precision: 8, scale: 5
      
      add :zone_id, references(:zones, on_delete: :nothing)
      # add :tax_category_id, references(:tax_categories, on_delete: :nothing)

      add :included_in_price, :boolean, default: false
      add :name, :string
      add :show_rate_in_label, :boolean, default: true
      add :deleted_at, :naive_datetime
      timestamps()
    end
  end
end
