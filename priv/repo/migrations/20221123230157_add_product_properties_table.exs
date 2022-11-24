defmodule StoreRepo.Repo.Migrations.AddProductPropertiesTable do
  use Ecto.Migration

  def change do
    create table("product_properties") do
      add :product_id, references(:products)
      add :property_id, references(:properties)
      timestamps()
    end
  end
end
