defmodule StoreRepo.Repo.Migrations.AddCreditCategoriesTable do
  use Ecto.Migration

  def change do
    create table("credit_categories") do
      add :name, :string
      timestamps()
    end
  end
end
