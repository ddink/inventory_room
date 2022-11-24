defmodule StoreRepo.Repo.Migrations.AddStoreCreditsTable do
  use Ecto.Migration

  def change do
    create table("store_credits") do
      add :amount, :decimal, precision: 8, scale: 2, default: "0.0", null: false
      add :amount_used, :decimal, precision: 8, scale: 2, default: "0.0", null: false
      add :amount_authorized, :decimal, precision: 8, scale: 2, default: "0.0", null: false
      add :currency, :string
      add :memo, :text
      add :deleted_at, :naive_datetime
      add :invalidated_at, :naive_datetime
      add :created_by_id, :naive_datetime
      add :user_id, references(:users)
      add :credit_category_id, references(:credit_categories)
      add :credit_type_id, references(:credit_types)
      timestamps()
    end
  end
end
