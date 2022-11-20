defmodule StoreRepo.Repo.Migrations.AddAdjustmentReasonsTable do
  use Ecto.Migration

  def change do
    create table("adjustment_reasons") do
      add :name, :string
      add :code, :string
      add :active, :boolean, default: true
      timestamps()
    end
  end
end
