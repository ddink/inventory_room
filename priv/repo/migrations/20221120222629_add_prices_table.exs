defmodule StoreRepo.Repo.Migrations.AddPricesTable do
  use Ecto.Migration

  def change do
    create table("prices") do
      add :variant_id, references(:variants, on_delete: :nothing), null: false
      add :amount, :decimal, precision: 10, scale: 2
      add :currency, :string
      add :deleted_at, :naive_datetime
      add :is_default, :boolean, default: true, null: false
      add :country_iso, :string
      timestamps()
    end
  end
end
