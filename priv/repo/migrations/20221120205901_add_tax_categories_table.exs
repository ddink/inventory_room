defmodule StoreRepo.Repo.Migrations.AddTaxCategoriesTable do
  use Ecto.Migration

  def change do
    create table("tax_categories") do
      add :name, :string
      add :description, :text
      add :is_default, :boolean, default: false
      add :tax_code, :string
      timestamps()
    end
  end
end
