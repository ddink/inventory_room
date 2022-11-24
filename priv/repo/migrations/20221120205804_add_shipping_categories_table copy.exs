defmodule StoreRepo.Repo.Migrations.AddShippingCategoriesTable do
  use Ecto.Migration

  def change do
    create table("shipping_categories") do
      add :name, :string
      timestamps()
    end
  end
end
