defmodule StoreRepo.Repo.Migrations.AddShippingMethodCategoriesTable do
  use Ecto.Migration

  def change do
    create table("shipping_method_categories") do
      add :shipping_category_id, references(:shipping_categories)
      add :shipping_method_id, references(:shipping_methods)
      timestamps()
    end
  end
end
