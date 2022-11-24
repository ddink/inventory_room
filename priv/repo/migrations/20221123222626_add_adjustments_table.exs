defmodule StoreRepo.Repo.Migrations.AddAdjustmentsTable do
  use Ecto.Migration

  def change do
    create table("adjustments") do
      add :amount, :decimal, precision: 10, scale: 2
      add :label, :string
      add :eligible, :boolean
      add :order_id, references(:orders)
      add :promotion_code_id, references(:promotion_codes)
      add :adjustment_reason_id, references(:adjustment_reasons)
      timestamps()
    end
  end
end
