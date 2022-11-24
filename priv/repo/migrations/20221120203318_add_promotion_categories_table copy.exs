defmodule StoreRepo.Repo.Migrations.AddPromotionCategoriesTable do
  use Ecto.Migration

  def change do
    create table("promotion_categories") do
      add :name, :string
      add :code, :string
      timestamps()
    end
  end
end
