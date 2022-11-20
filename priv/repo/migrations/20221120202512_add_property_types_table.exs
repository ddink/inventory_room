defmodule StoreRepo.Repo.Migrations.AddPropertyTypesTable do
  use Ecto.Migration

  def change do
    create table("property_types") do
      add :name, :string
      add :presentation, :string, null: false
      timestamps()
    end
  end
end
