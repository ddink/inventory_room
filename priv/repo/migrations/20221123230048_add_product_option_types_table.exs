defmodule StoreRepo.Repo.Migrations.AddProductOptionTypesTable do
  use Ecto.Migration

  def change do
    create table("product_option_types") do
      add :product_id, references(:products)
      add :option_type_id, references(:option_types)
      timestamps()
    end
  end
end
