defmodule StoreRepo.Repo.Migrations.AddPromotionCodesTable do
  use Ecto.Migration

  def change do
    create table("promotion_codes") do
      add :promotion_id, references(:promotions)
      add :value, :string
      timestamps()
    end
  end
end
